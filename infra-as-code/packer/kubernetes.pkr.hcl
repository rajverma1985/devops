packer {
  required_plugins {
    proxmox = {
      version = ">= 1.1.3"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

# Input variables
variable "proxmox_api_url" {
  type    = string
  default = "${env("PROXMOX_API_URL")}" # Use environment variable
}

variable "proxmox_api_token_id" {
  type    = string
  default = "${env("PROXMOX_API_TOKEN_ID")}" # Use environment variable
}

variable "proxmox_api_token_secret" {
  type    = string
  default = "${env("PROXMOX_API_TOKEN_SECRET")}" # Use environment variable
}

variable "proxmox_node" {
  type    = string
  default = "lxcn7" # Replace with your Proxmox node name
}

variable "ssh_password" {
  type    = string
  default = "${env("SSH_PASSWORD")}" # Use environment variable
}

source "proxmox-iso" "kubernetes" {
  # Proxmox API connection details
  proxmox_url              = var.proxmox_api_url
  username                 = var.proxmox_api_token_id
  token                    = var.proxmox_api_token_secret
  insecure_skip_tls_verify = true # Set to false if using a valid SSL certificate

  # VM configuration
  node                 = var.proxmox_node
  vm_id                = 9000 # Template VM ID
  vm_name              = "kubernetes-template"
  template_description = "Kubernetes Node Template"

  # Boot ISO configuration
  boot_iso {
    iso_file         = "local:iso/ubuntu-22.04.3-live-server-amd64.iso" # Path to the ISO file
    iso_checksum     = "sha256:5f338e1a6b1abf5f15a9a0f6a5f5a5f5a5f5a5f5a5f5a5f5a5f5a5f5a5f5a5f" # Replace with the actual checksum
    iso_storage_pool = "local" # Storage pool where the ISO is located
  }
  
  # Boot command for automated installation
  boot_command = [
        "<wait3s>c<wait3s>",
        "linux /casper/vmlinuz --- ",
        # <client-ip>:<server-ip>:<gw-ip>:<netmask>:<hostname>:<device>:<autoconf>:<dns0-ip>:<dns1-ip>:<ntp0-ip>:...
        "ip=::::::dhcp::: ",    # autoconf=dhcp - this is the line I had to add to get DHCP working
        # IP of Windows PC with port mapped to WSL2
        "autoinstall 'ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/'",    # even got it working with WSL2!
        "<enter><wait>",
        "initrd /casper/initrd",
        "<enter><wait>",
        "boot",
        "<enter>"
    ]
  boot_key_interval = "150ms"

  # VM hardware configuration
  memory           = 4096 # RAM in MB
  cores            = 2    # Number of CPU cores
  sockets          = 1    # Number of CPU sockets
  os               = "l26" # OS type (Linux 2.6/3.x/4.x/5.x)
  scsi_controller  = "virtio-scsi-pci" # SCSI controller type

  # Disk configuration
  disks {
    type              = "scsi"
    disk_size         = "20G"
    storage_pool      = "local-lvm" # Storage pool for the disk
  }

  # Network configuration
  network_adapters {
    model  = "virtio"
    bridge = "vmbr0" # Replace with your bridge name
  }

  # Cloud-init configuration
  cloud_init              = true
  cloud_init_storage_pool = "local-lvm" # Storage pool for cloud-init

  # SSH configuration
  ssh_username = "ubuntu"
  ssh_password = var.ssh_password # Use the SSH password variable
  ssh_timeout  = "20m"
}

build {
  sources = ["source.proxmox-iso.kubernetes"]

  # Provisioning scripts
  provisioner "shell" {
    scripts = [
      "scripts/install_docker.sh",
      "scripts/install_k8s.sh"
    ]
  }
}