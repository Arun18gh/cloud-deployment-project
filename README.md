# Cloud Automated Container Deployment and Administration

## 📘 Project Overview
The purpose of this project is to demonstrate the deployment of a secured web application on AWS using modern DevOps tools. Deployment is fully automated using:
- **Terraform** to provision cloud infrastructure (EC2 instance)
- **Ansible** to install and configure Docker
- **Docker** to containerize the static web application
- **GitHub Actions** to automate the CI/CD pipeline

---

## 🗂️ Folder Structure
```
cloud-deployment-project/
├── .github/
│   └── workflows/
│       └── deploy.yml           # GitHub Actions workflow
├── ansible/
│   ├── playbook.yml            # Ansible playbook to install Docker
│   └── destroy.yml             # Optional: clean-up script
├── webapp/
│   ├── Dockerfile              # Builds the web server container
│   └── index.html              # Sample web page
├── .gitignore                  # Terraform exclusions
├── backend.tf                  # Terraform backend config (optional)
├── main.tf                     # Main Terraform file (provisions EC2)
```

---

## 🚀 How to Deploy

### 1️⃣ Provision Infrastructure Using Terraform
```bash
cd cloud-deployment-project
terraform init
terraform apply
```

Create an EC2 instance, key-pair, and security group allowing ports 80 (HTTP) and 22 (SSH).

---

### 2️⃣ Server Configuration by Ansible
Ensure that the EC2 public IP is in the `ansible/hosts` file, and then run:
```bash
cd ansible
ansible-playbook -i hosts playbook.yml
```

This will install Docker and configure it to be started on boot.

---

### 3️⃣ Deploy Website with Docker
SSH into the EC2 Instance:

```bash
ssh -i your-key.pem ec2-user@your-ec2-public-ip
cd webapp
docker build -t webapp .
docker run -d -p 80:80 webapp
```

Get your browser to `http://your-ec2-public-ip` and check it out.

---

### 4️⃣ Setup CI/CD with GitHub Actions
The `deploy.yml` file can easily be configured to deploy from GitHub to EC2 over SSH.

#### Secrets to Add in GitHub Repo Settings:
- `HOST` → your EC2 public IP
- `USERNAME` → usually `ec2-user`
- `SSH_KEY` → contents of your PEM private key

Every push to the `main` branch will trigger GitHub Actions to auto-deploy the app.

---

## 🖼️ Architecture Diagram
```
GitHub Actions ───> SSH ───> AWS EC2 ── Docker ──> Web App (index.html)
```
![Architecture](./screenshots/architecture.png)  

---

## 📷 Screenshots
> Upload inside a `/screenshots` folder:
- Terraform Apply Success  
- Ansible Setup Logs  
- Browser View of Web-App  
- GitHub Actions Workflow Run  

---

## 📚 References
- [Terraform Docs](https://developer.hashicorp.com/terraform)
- [Ansible Docs](https://docs.ansible.com/)
- [Docker Docs](https://docs.docker.com/)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [AWS EC2](https://docs.aws.amazon.com/ec2)

---

## 👤 Author
Arun Sudhakar (20061730)
Module: B9IS121 – Network Systems and Administration  
Instructor: Kingsley Ibomo  
Dublin Business School (DBS)
