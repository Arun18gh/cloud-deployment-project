# Automated Container Deployment and Administration in the Cloud

## 📘 Project Overview
This project demonstrates the end-to-end automation of cloud infrastructure and application deployment using DevOps tools. It provisions an AWS EC2 instance using Terraform, configures it with Ansible, containerizes a static web app using Docker, and uses GitHub Actions to automate the CI/CD pipeline.

---

## 🧰 Tools Used
- **Terraform** – Infrastructure as Code for EC2 provisioning
- **Ansible** – Configuration management (installing Docker)
- **Docker** – Containerization of the web app (HTML)
- **GitHub Actions** – CI/CD automation triggered on push to main
- **AWS EC2** – Host instance for application deployment

---

## 🗂️ Folder Structure
```
cloud-deployment-project/
├── .github/
│   └── workflows/
│       └── deploy.yml              # GitHub Actions pipeline
├── ansible/
│   ├── playbook.yml               # Installs Docker
│   └── destroy.yml                # Optional cleanup playbook
├── webapp/
│   ├── Dockerfile                 # Builds Docker container
│   └── index.html                 # Web page served by container
├── terraform/
│   ├── main.tf                    # EC2 provisioning script
│   └── backend.tf                 # (optional) backend storage config
├── .gitignore                     # Ignores .terraform and state files
├── README.md                      # Project documentation (this file)
└── screenshots/
    ├── terraform-output.png
    ├── ansible-setup.png
    ├── docker-app-running.png
    ├── github-push-terminal.png
    ├── github-actions-log.png
    └── architecture.png
```

---

## 🚀 How to Deploy This Project

### ✅ Step 1: Provision Infrastructure with Terraform
```bash
cd terraform
terraform init
terraform apply
```
This will:
- Create an EC2 instance
- Create security group (ports 22 and 80 open)
- Output the public IP of the instance

---

### ✅ Step 2: Configure Server with Ansible
1. Edit the `hosts` file or use command line to define EC2 IP
2. Run:
```bash
cd ansible
ansible-playbook -i "ec2-ip," playbook.yml --private-key your-key.pem -u ec2-user
```

---

### ✅ Step 3: Deploy Web App with Docker
SSH into the EC2 instance and run:
```bash
cd webapp
docker build -t webapp .
docker run -d -p 80:80 webapp
```

Open `http://<your-ec2-ip>` in a browser — you’ll see the HTML page!

---

### ✅ Step 4: Enable CI/CD with GitHub Actions
- Secrets to add in GitHub:
  - `HOST`: your EC2 IP
  - `USERNAME`: `ec2-user`
  - `SSH_KEY`: PEM file content (single line)

Push code to `main` branch to trigger deployment.

---

## 📷 Screenshots

| Figure | Description | Filename |
|--------|-------------|----------|
| 1 | Git push to GitHub | `github-push-terminal.png` |
| 2 | Terraform apply (EC2 created) | `terraform-output.png` |
| 3 | Ansible installs Docker | `ansible-setup.png` |
| 4 | Web app in browser | `docker-app-running.png` |
| 5 | GitHub Actions job steps | `github-actions-log.png` |
| 6 | Architecture diagram | `architecture.png` |

---

## 🖼️ Architecture Diagram

![Architecture Diagram](./screenshots/architecture.png)

---

## 🔗 Live Demo
> http://<your-ec2-ip>  
(Shows: “Hello from HTTP Docker Web Server!”)

---

## 👤 Author
**Arun Sudhakar**  
Module: B9IS121 – Network Systems and Administration  
Instructor: Kingsley Ibomo  
Institution: Dublin Business School (DBS)

---

## 📚 References
- [Terraform Docs](https://developer.hashicorp.com/terraform)
- [Ansible Docs](https://docs.ansible.com/)
- [Docker Docs](https://docs.docker.com/)
- [GitHub Actions](https://docs.github.com/en/actions)
- [AWS EC2 Guide](https://docs.aws.amazon.com/ec2)
