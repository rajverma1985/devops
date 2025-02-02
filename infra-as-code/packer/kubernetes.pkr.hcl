variable "proxmox_api_url" {
  type    = string
  default = env("PROXMOX_API_URL")
}

variable "proxmox_api_token_id" {
  type    = string
  default = env("PROXMOX_API_TOKEN_ID")
}

variable "proxmox_api_token_secret" {
  type    = string
  default = env("PROXMOX_API_TOKEN_SECRET")
}

source "proxmox" "kubernetes" {
  proxmox_url              = var.proxmox_api_url
  username                 = var.proxmox_api_token_id
  token                    = var.proxmox_api_token_secret
  insecure_skip_tls_verify = true

  node                 = "pve"
  vm_id                = 9000
  vm_name              = "kubernetes-template"
  template_description = "Kubernetes Node Template"

  iso_file         = "local:iso/ubuntu-22.04-live-server-amd64.iso"
  ssh_username     = "ubuntu"
  ssh_password     = env("SSH_PASSWORD")
  ssh_timeout      = "20m"
  http_directory   = "http"
  boot_command     = [
    "<esc><wait>",
    "linux /casper/vmlinuz quiet autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---",
    "<enter>"
  ]
  boot_wait        = "5s"
  memory           = 4096
  cores            = 2
  sockets          = 1
  os               = "l26"
  cloud_init       = true
  cloud_init_storage_pool = "local-lvm"
}

build {
  sources = ["source.proxmox.kubernetes"]

  provisioner "shell" {
    scripts = [
      "scripts/install_docker.sh",
      "scripts/install_k8s.sh"
    ]
  }
}
