#!/bin/bash

# Define the base directory
BASE_DIR="infra-as-code"

# Create the base directory
mkdir -p "$BASE_DIR"

# Create Packer directory and files
mkdir -p "$BASE_DIR/packer/scripts"
cat <<EOL > "$BASE_DIR/packer/kubernetes.pkr.hcl"
$(curl -s https://raw.githubusercontent.com/your-repo/packer/kubernetes.pkr.hcl)
EOL
cat <<EOL > "$BASE_DIR/packer/scripts/install_docker.sh"
$(curl -s https://raw.githubusercontent.com/your-repo/packer/scripts/install_docker.sh)
EOL
cat <<EOL > "$BASE_DIR/packer/scripts/install_k8s.sh"
$(curl -s https://raw.githubusercontent.com/your-repo/packer/scripts/install_k8s.sh)
EOL

# Create Vagrant directory and files
mkdir -p "$BASE_DIR/vagrant/scripts"
touch "$BASE_DIR/vagrant/Vagrantfile"
touch "$BASE_DIR/vagrant/scripts/master.sh"
touch "$BASE_DIR/vagrant/scripts/worker.sh"

# Create Terraform directory and files
mkdir -p "$BASE_DIR/terraform/templates"
cat <<EOL > "$BASE_DIR/terraform/main.tf"
$(curl -s https://raw.githubusercontent.com/your-repo/terraform/main.tf)
EOL
cat <<EOL > "$BASE_DIR/terraform/variables.tf"
$(curl -s https://raw.githubusercontent.com/your-repo/terraform/variables.tf)
EOL
cat <<EOL > "$BASE_DIR/terraform/outputs.tf"
$(curl -s https://raw.githubusercontent.com/your-repo/terraform/outputs.tf)
EOL
touch "$BASE_DIR/terraform/templates/master.cfg"
touch "$BASE_DIR/terraform/templates/worker.cfg"

# Create Ansible directory and files
mkdir -p "$BASE_DIR/ansible/roles/kubernetes-master"
mkdir -p "$BASE_DIR/ansible/roles/kubernetes-worker"
cat <<EOL > "$BASE_DIR/ansible/inventory"
$(curl -s https://raw.githubusercontent.com/your-repo/ansible/inventory)
EOL
cat <<EOL > "$BASE_DIR/ansible/playbook.yml"
$(curl -s https://raw.githubusercontent.com/your-repo/ansible/playbook.yml)
EOL

# Create Kubernetes directory and files
mkdir -p "$BASE_DIR/kubernetes/apps/app1"
mkdir -p "$BASE_DIR/kubernetes/apps/app2"
mkdir -p "$BASE_DIR/kubernetes/monitoring"
mkdir -p "$BASE_DIR/kubernetes/argocd"
cat <<EOL > "$BASE_DIR/kubernetes/apps/app1/deployment.yaml"
$(curl -s https://raw.githubusercontent.com/your-repo/kubernetes/apps/app1/deployment.yaml)
EOL

# Create Helm directory and files
mkdir -p "$BASE_DIR/helm/app1"
cat <<EOL > "$BASE_DIR/helm/app1/values.yaml"
$(curl -s https://raw.githubusercontent.com/your-repo/helm/app1/values.yaml)
EOL

# Create GitHub Actions directory and files
mkdir -p "$BASE_DIR/github-actions"
cat <<EOL > "$BASE_DIR/github-actions/infra-ci.yml"
$(curl -s https://raw.githubusercontent.com/your-repo/github-actions/infra-ci.yml)
EOL

# Create README.md
cat <<EOL > "$BASE_DIR/README.md"
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
EOL

# Output success message
echo "Folder structure and files created successfully in $BASE_DIR/"
