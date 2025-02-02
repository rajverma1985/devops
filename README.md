# Infrastructure as Code (IaC) Project

This repository contains the **Infrastructure as Code (IaC) setup** for deploying and managing a **Kubernetes cluster** and associated applications. The project is structured into multiple directories, each dedicated to a specific tool or technology.

---

## 📂 Project Structure  

```plaintext
infra-as-code/
├── packer/
│   ├── kubernetes.pkr.hcl
│   └── scripts/
│       ├── install_docker.sh
│       └── install_k8s.sh
├── vagrant/
│   ├── Vagrantfile
│   └── scripts/
│       ├── master.sh
│       └── worker.sh
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── templates/
│       ├── master.cfg
│       └── worker.cfg
├── ansible/
│   ├── inventory
│   ├── playbook.yml
│   └── roles/
│       ├── kubernetes-master/
│       └── kubernetes-worker/
├── kubernetes/
│   ├── apps/
│   │   ├── app1/
│   │   │   └── deployment.yaml
│   │   └── app2/
│   ├── monitoring/
│   └── argocd/
├── helm/
│   ├── app1/
│   │   └── values.yaml
│   └── app2/
├── github-actions/
│   ├── infra-ci.yml
│   └── app-cd.yml
└── README.md
```

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
```

---

### ✅ **Features of this Markdown File**  
✔ **GitHub-friendly formatting** with proper headings, bullet points, and code blocks.  
✔ **Clear directory structure** for easy reference.  
✔ **Step-by-step usage instructions** for deployment.  
✔ **Includes automation via GitHub Actions**.  
✔ **Enhanced readability with emojis & bold sections**.  

🚀 Feel free to open issues for feedback and suggestions! 🎯
