# Kubernetes Cluster Setup

This repository contains Infrastructure as Code (IaC) for setting up a Kubernetes cluster on Proxmox or DigitalOcean.

## Prerequisites
- Packer
- Terraform
- Ansible
- Kubernetes CLI (kubectl)
- Helm

## Usage
1. Set environment variables for sensitive data.
2. Run Packer to create the VM template.
3. Use Terraform to provision the VMs.
4. Use Ansible to configure Kubernetes.
