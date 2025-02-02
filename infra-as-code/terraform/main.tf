provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
}

resource "proxmox_vm_qemu" "kubernetes_master" {
  name        = "k8s-master"
  target_node = "pve"
  clone       = "kubernetes-template"
  cores       = 2
  memory      = 4096
  agent       = 1

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "20G"
  }

  cloudinit_cdrom_storage = "local-lvm"
}

resource "proxmox_vm_qemu" "kubernetes_worker" {
  count       = 2
  name        = "k8s-worker-${count.index}"
  target_node = "pve"
  clone       = "kubernetes-template"
  cores       = 2
  memory      = 4096
  agent       = 1

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  disk {
    type    = "scsi"
    storage = "local-lvm"
    size    = "20G"
  }

  cloudinit_cdrom_storage = "local-lvm"
}
