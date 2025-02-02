#!/bin/bash

# Define the base directory
BASE_DIR="infra-as-code"

# Create the base directory
mkdir -p "$BASE_DIR"

# Create Packer directory and files
mkdir -p "$BASE_DIR/packer/scripts"
touch "$BASE_DIR/packer/kubernetes.json"
touch "$BASE_DIR/packer/scripts/install_docker.sh"
touch "$BASE_DIR/packer/scripts/install_k8s.sh"

# Create Vagrant directory and files
mkdir -p "$BASE_DIR/vagrant/scripts"
touch "$BASE_DIR/vagrant/Vagrantfile"
touch "$BASE_DIR/vagrant/scripts/master.sh"
touch "$BASE_DIR/vagrant/scripts/worker.sh"

# Create Terraform directory and files
mkdir -p "$BASE_DIR/terraform/templates"
touch "$BASE_DIR/terraform/main.tf"
touch "$BASE_DIR/terraform/variables.tf"
touch "$BASE_DIR/terraform/outputs.tf"
touch "$BASE_DIR/terraform/templates/master.cfg"
touch "$BASE_DIR/terraform/templates/worker.cfg"

# Create Ansible directory and files
mkdir -p "$BASE_DIR/ansible/roles/kubernetes-master"
mkdir -p "$BASE_DIR/ansible/roles/kubernetes-worker"
touch "$BASE_DIR/ansible/inventory"
touch "$BASE_DIR/ansible/playbook.yml"

# Create Kubernetes directory and files
mkdir -p "$BASE_DIR/kubernetes/apps/app1"
mkdir -p "$BASE_DIR/kubernetes/apps/app2"
mkdir -p "$BASE_DIR/kubernetes/monitoring"
mkdir -p "$BASE_DIR/kubernetes/argocd"

# Create Helm directory and files
mkdir -p "$BASE_DIR/helm/app1"
mkdir -p "$BASE_DIR/helm/app2"

# Create GitHub Actions directory and files
mkdir -p "$BASE_DIR/github-actions"
touch "$BASE_DIR/github-actions/infra-ci.yml"
touch "$BASE_DIR/github-actions/app-cd.yml"

# Create README.md
touch "$BASE_DIR/README.md"

# Output success message
echo "Folder structure and placeholder files created successfully in $BASE_DIR/"
