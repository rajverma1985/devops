# Infrastructure as Code (IaC) Project

This repository contains the **Infrastructure as Code (IaC) setup** for deploying and managing a **Kubernetes cluster** and associated applications. The project is structured into multiple directories, each dedicated to a specific tool or technology.

---

## 📂 Project Structure

📂 INFRA-AS-CODE/  
├── 📦 [![Packer](https://img.shields.io/badge/-Packer-02A8F4?logo=packer&logoColor=white)](https://www.packer.io/)  
│   ├── 📄 kubernetes.pkr.hcl  
│   └── 📂 scripts/  
│       ├── 📜 install_docker.sh  
│       └── 📜 install_k8s.sh  
├── 📦 [![Vagrant](https://img.shields.io/badge/-Vagrant-1563FF?logo=vagrant&logoColor=white)](https://www.vagrantup.com/)  
│   ├── 📄 Vagrantfile  
│   └── 📂 scripts/  
│       ├── 📜 master.sh  
│       └── 📜 worker.sh  
├── 🌍 [![Terraform](https://img.shields.io/badge/-Terraform-623CE4?logo=terraform&logoColor=white)](https://www.terraform.io/)  
│   ├── 📄 main.tf  
│   ├── 📄 variables.tf  
│   ├── 📄 outputs.tf  
│   └── 📂 templates/  
│       ├── 📜 master.cfg  
│       └── 📜 worker.cfg  
├── ⚙️ [![Ansible](https://img.shields.io/badge/-Ansible-EE0000?logo=ansible&logoColor=white)](https://www.ansible.com/)  
│   ├── 📄 inventory  
│   ├── 📄 playbook.yml  
│   └── 📂 roles/  
│       ├── 📂 kubernetes-master/  
│       └── 📂 kubernetes-worker/  
├── ☸️ [![Kubernetes](https://img.shields.io/badge/-Kubernetes-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)  
│   ├── 📂 apps/  
│   │   ├── 📂 app1/  
│   │   │   └── 📜 deployment.yaml  
│   │   └── 📂 app2/  
│   ├── 📂 monitoring/  
│   └── 📂 argocd/  
├── 🚀 [![Helm](https://img.shields.io/badge/-Helm-0F1689?logo=helm&logoColor=white)](https://helm.sh/)  
│   ├── 📂 app1/  
│   │   └── 📜 values.yaml  
│   └── 📂 app2/  
├── 🤖 [![GitHub Actions](https://img.shields.io/badge/-GitHub_Actions-2088FF?logo=github-actions&logoColor=white)](https://github.com/features/actions)  
│   ├── 📄 infra-ci.yml  
│   └── 📄 app-cd.yml  
└── 📘 readme.md  


---

## 📖 Directory Overview  

### 📂 **1. Packer**  
- Contains **Packer templates** (`kubernetes.pkr.hcl`) for creating **machine images** with **Docker and Kubernetes** pre-installed.
- **Scripts**:  
  - `install_docker.sh` → Installs Docker on the base image.  
  - `install_k8s.sh` → Installs Kubernetes components.  

### 📂 **2. Vagrant**  
- Contains the `Vagrantfile` for **local Kubernetes cluster provisioning**.
- **Scripts**:  
  - `master.sh` → Configures the **Kubernetes master node**.  
  - `worker.sh` → Configures the **Kubernetes worker nodes**.  

### 📂 **3. Terraform**  
- Contains **Terraform configurations** for **cloud infrastructure provisioning**.
- **Files**:  
  - `main.tf` → Main Terraform configuration.  
  - `variables.tf` → Input variables for Terraform.  
  - `outputs.tf` → Outputs from Terraform.  
- **Templates**:  
  - `master.cfg` → Configuration template for the master node.  
  - `worker.cfg` → Configuration template for worker nodes.  

### 📂 **4. Ansible**  
- Contains **Ansible playbooks and roles** for configuring Kubernetes nodes.
- **Files**:  
  - `inventory` → Inventory file for Ansible.  
  - `playbook.yml` → Main playbook for Kubernetes setup.  
- **Roles**:  
  - `kubernetes-master/` → Role for configuring the **Kubernetes master node**.  
  - `kubernetes-worker/` → Role for configuring **worker nodes**.  

### 📂 **5. Kubernetes**  
- Contains **Kubernetes manifests** for **deploying applications and services**.
- **Directories**:  
  - `apps/` → Application-specific manifests.  
    - `app1/` → Manifests for **Application 1**.  
    - `app2/` → Manifests for **Application 2**.  
  - `monitoring/` → Manifests for **Prometheus and Alertmanager** monitoring.  
  - `argocd/` → Manifests for **ArgoCD deployment**.  

### 📂 **6. Helm**  
- Contains **Helm charts** for deploying applications.
- **Directories**:  
  - `app1/` → Helm chart for **Application 1**.  
  - `app2/` → Helm chart for **Application 2**.  

### 📂 **7. GitHub Actions**  
- Contains **CI/CD workflows** for **infrastructure and application deployment**.
- **Files**:  
  - `infra-ci.yml` → **CI workflow** for infrastructure changes.  
  - `app-cd.yml` → **CD workflow** for application deployment.  

---

## 🚀 Usage  

### **1️⃣ Build Machine Images with Packer**  
```bash
cd packer/
packer build kubernetes.pkr.hcl
```

### **2️⃣ Provision Local Kubernetes Cluster with Vagrant**  
```bash
cd vagrant/
vagrant up
```

### **3️⃣ Deploy Cloud Infrastructure with Terraform**  
```bash
cd terraform/
terraform init
terraform apply
```

### **4️⃣ Configure Kubernetes Nodes with Ansible**  
```bash
cd ansible/
ansible-playbook -i inventory playbook.yml
```

### **5️⃣ Deploy Applications to Kubernetes**  
```bash
kubectl apply -f kubernetes/apps/app1/deployment.yaml
```

### **6️⃣ Deploy Applications using Helm**  
```bash
helm install app1 helm/app1/
```

### **7️⃣ Automate CI/CD with GitHub Actions**  
- CI/CD workflows are automatically triggered on **push**.  
- Infrastructure changes are handled in **infra-ci.yml**.  
- Application deployments are handled in **app-cd.yml**.  

---

## 🤝 Contributing  

Contributions are welcome! Please follow the [Contribution Guidelines](CONTRIBUTING.md) to get started.

---

## 📜 License  

This project is licensed under the **[MIT License](LICENSE)**.


---

### ✅ **Features of this Markdown File**  
✔ **GitHub-friendly formatting** with proper headings, bullet points, and code blocks.  
✔ **Clear directory structure** for easy reference.  
✔ **Step-by-step usage instructions** for deployment.  
✔ **Includes automation via GitHub Actions**.  
✔ **Enhanced readability with emojis & bold sections**.  

🚀 Feel free to open issues for feedback and suggestions! 🎯

```
