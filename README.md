# devops
Please find the details of the  `README.md` file `infra-as-code` with project structure mentioned below:

```markdown
# Infrastructure as Code (IaC) Project

This repository contains the Infrastructure as Code (IaC) setup for deploying and managing a Kubernetes cluster and associated applications. The project is organized into multiple directories, each focusing on a specific tool or technology.

## Project Structure

Here is your directory structure formatted in **GitHub Markdown**:  

```plaintext
# Infrastructure-as-Code (IaC) Repository Structure

```
📂 **infra-as-code/**  
├── 📂 **packer/**  
│   ├── 📄 kubernetes.pkr.hcl  
│   └── 📂 **scripts/**  
│       ├── 📄 install_docker.sh  
│       └── 📄 install_k8s.sh  
├── 📂 **vagrant/**  
│   ├── 📄 Vagrantfile  
│   └── 📂 **scripts/**  
│       ├── 📄 master.sh  
│       └── 📄 worker.sh  
├── 📂 **terraform/**  
│   ├── 📄 main.tf  
│   ├── 📄 variables.tf  
│   ├── 📄 outputs.tf  
│   └── 📂 **templates/**  
│       ├── 📄 master.cfg  
│       └── 📄 worker.cfg  
├── 📂 **ansible/**  
│   ├── 📄 inventory  
│   ├── 📄 playbook.yml  
│   └── 📂 **roles/**  
│       ├── 📂 kubernetes-master/  
│       └── 📂 kubernetes-worker/  
├── 📂 **kubernetes/**  
│   ├── 📂 **apps/**  
│   │   ├── 📂 app1/  
│   │   │   └── 📄 deployment.yaml  
│   │   └── 📂 app2/  
│   ├── 📂 monitoring/  
│   └── 📂 argocd/  
├── 📂 **helm/**  
│   ├── 📂 app1/  
│   │   └── 📄 values.yaml  
│   └── 📂 app2/  
├── 📂 **github-actions/**  
│   ├── 📄 infra-ci.yml  
│   └── 📄 app-cd.yml  
└── 📄 **README.md**  
```

## Directory Overview

### 1. **Packer**
- Contains Packer templates (`kubernetes.pkr.hcl`) for creating machine images with Docker and Kubernetes pre-installed.
- **Scripts**:
  - `install_docker.sh`: Installs Docker on the base image.
  - `install_k8s.sh`: Installs Kubernetes components.

### 2. **Vagrant**
- Contains the `Vagrantfile` for provisioning local Kubernetes clusters.
- **Scripts**:
  - `master.sh`: Configures the Kubernetes master node.
  - `worker.sh`: Configures the Kubernetes worker nodes.

### 3. **Terraform**
- Contains Terraform configurations for provisioning cloud infrastructure.
- **Files**:
  - `main.tf`: Main Terraform configuration.
  - `variables.tf`: Input variables for Terraform.
  - `outputs.tf`: Outputs from Terraform.
- **Templates**:
  - `master.cfg`: Configuration template for the master node.
  - `worker.cfg`: Configuration template for worker nodes.

### 4. **Ansible**
- Contains Ansible playbooks and roles for configuring Kubernetes nodes.
- **Files**:
  - `inventory`: Inventory file for Ansible.
  - `playbook.yml`: Main playbook for Kubernetes setup.
- **Roles**:
  - `kubernetes-master`: Role for configuring the master node.
  - `kubernetes-worker`: Role for configuring worker nodes.

### 5. **Kubernetes**
- Contains Kubernetes manifests for deploying applications and services.
- **Directories**:
  - `apps/`: Application-specific manifests.
    - `app1/`: Manifests for Application 1.
    - `app2/`: Manifests for Application 2.
  - `monitoring/`: Manifests for monitoring tools.
  - `argocd/`: Manifests for ArgoCD setup.

### 6. **Helm**
- Contains Helm charts for deploying applications.
- **Directories**:
  - `app1/`: Helm chart for Application 1.
  - `app2/`: Helm chart for Application 2.

### 7. **GitHub Actions**
- Contains CI/CD workflows for infrastructure and application deployment.
- **Files**:
  - `infra-ci.yml`: CI workflow for infrastructure changes.
  - `app-cd.yml`: CD workflow for application deployment.

## Usage

1. **Packer**: Build machine images with Docker and Kubernetes pre-installed.
   ```bash
   cd packer/
   packer build kubernetes.pkr.hcl
   ```

2. **Vagrant**: Provision a local Kubernetes cluster.
   ```bash
   cd vagrant/
   vagrant up
   ```

3. **Terraform**: Provision cloud infrastructure.
   ```bash
   cd terraform/
   terraform init
   terraform apply
   ```

4. **Ansible**: Configure Kubernetes nodes.
   ```bash
   cd ansible/
   ansible-playbook -i inventory playbook.yml
   ```

5. **Kubernetes**: Deploy applications.
   ```bash
   kubectl apply -f kubernetes/apps/app1/deployment.yaml
   ```

6. **Helm**: Deploy applications using Helm.
   ```bash
   helm install app1 helm/app1/
   ```

7. **GitHub Actions**: Automate CI/CD workflows using GitHub Actions.

## Contributing

Contributions are welcome! Please follow the [contribution guidelines](CONTRIBUTING.md) to get started.

## License

This project is licensed under the [MIT License](LICENSE).
```
