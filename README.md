# cloud-deployment-project
# Automated Container Deployment and Administration in the Cloud

📘 Overview
This project demonstrates a fully automated DevOps pipeline using:
- Terraform – for AWS EC2 infrastructure
- Ansible – to configure the server (install Docker)
- Docker – to containerize a Flask app
- GitHub Actions – to automatically deploy on code push

🗂️ Project Structure

cloud-deployment-project/
├── terraform/
│   └── main.tf
├── ansible/
│   ├── install_docker.yml
│   └── hosts
├── docker/
│   ├── app.py
│   └── Dockerfile
└── .github/
    └── workflows/
        └── deploy.yml

🚀 How to Run This Project

Step 1: Provision EC2 with Terraform
bash
cd terraform
terraform init
terraform apply


Step 2: Configure Server with Ansible
- Add EC2 public IP to `ansible/hosts`
bash
cd ansible
ansible-playbook -i hosts install_docker.yml


 Step 3: Deploy Flask App with Docker
bash
docker build -t myapp .
docker run -d -p 80:80 myapp


 Step 4: Enable CI/CD with GitHub Actions
- Add these secrets in your GitHub repository:
  - `HOST`: your EC2 public IP (e.g., 3.110.45.66)
  - `USERNAME`: usually `ec2-user`
  - `SSH_KEY`: paste content of your `.pem` key
- GitHub Actions will auto-deploy on every push to `main`

 📷 Screenshots
> Add these in a `/screenshots` folder and update the paths if needed:
![Terraform](./screenshots/terraform-output.png)  
![Ansible](./screenshots/ansible-setup.png)  
![Flask App](./screenshots/flask-app-running.png)  
![GitHub Actions](./screenshots/github-actions-log.png)

🖼️ Architecture Diagram
![Architecture Diagram](./screenshots/architecture.png)

🔗 Live Demo
Visit: http://<your-ec2-public-ip>

📚 References
- [Terraform Docs](https://developer.hashicorp.com/terraform)
- [Ansible Docs](https://docs.ansible.com/)
- [Docker Docs](https://docs.docker.com/)
- [GitHub Actions Docs](https://docs.github.com/en/actions)
- [Flask Docs](https://flask.palletsprojects.com/)

👤 Author
Arun Sudhakar  
Module: B9IS121 – Network Systems and Administration  
Institution: Dublin Business School (DBS)
