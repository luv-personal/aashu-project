---
DevOps Assignment Setup Using AWS EC2, Docker, and GitHub
---

# 1. Launching an EC2 Instance on AWS

1\. Log in to AWS account and launch a new EC2 instance.\
2. Assign the name "devops-assignment" and select Ubuntu OS as the
operating system.\
3. Created a new key pair named "Devops" and download the .pem file.\
4. In the network settings, selected a public subnet.\
5. Created a new Security Group called devops-assignment-sg.

# 2. Configure Security Group Rules

SSH Access:
- Port: 22
- Source: My IP

HTTP Access:
- Port: 80
- Source: My IP

# 3. Storage Configuration

Allocate 8 GiB of storage with a gp3 root volume.

# 4. Connect to the EC2 Instance

1\. Launch the instance and go to its Instance ID to connect.\
2. On local terminal:\
chmod 400 devops.pem\
ssh -i \"devops.pem\" ubuntu@ec2-54-147-130-125.compute-1.amazonaws.com

# 5. Create a New User

- Add a user: **sudo adduser deployuser**
- Grant Docker permissions: **sudo usermod -aG docker deployuser**
- Switch to the new user: su - deployuser

# 6. Setup Docker and Docker Compose

1\. Create a working directory: mkdir dev-project && cd dev-project\
2. Create the setup script: vi bootstrap.sh\
3. Make it executable and run it:\
- chmod +x bootstrap.sh\
- ./bootstrap.sh\


# 7. Create Flask Web App

1\. Create a directory for your app: mkdir pythonapp && cd pythonapp
2. Inside this folder, create:
- app.py: Flask application
- requirements.txt: Flask dependency
- Dockerfile: Instructions to build app
- docker-compose.yml: Container config

# 8. Build and Run the Container

Run: docker compose up -d

# 9. Test the Web App

Visit: http://54.147.130.125\
Output: \'Hello from your Aashutosh's container!\'

# 10. Troubleshooting

- Check logs: docker logs \<container-id\>
- View container status: docker ps -a

# GitHub Workflow

1\. Create and navigate to local repo:\
mkdir repo && cd repo\
2. Clone the repo:\
git clone https://github.com/luv-personal/aashu-project.git\
cd aashu-project\
3. Create branch: git checkout -b dev-testing\
4. Add project files and push:\
git add .\
git commit -m \"Initial commit - Dockerized Flask app with EC2 setup\"\
git push origin dev-testing

# AWS Resources Used

  ----------------------------------- -----------------------------------
  Resource Type                       Name / Details

  EC2 Instance                        devops-assignment (Ubuntu)

  Key Pair                            Devops.pem

  VPC Subnet                          Public Subnet

  Security Group                      devops-assignment-sg

  Inbound Rules                       SSH (22) and HTTP (80)

  Storage Volume                      8 GiB gp3

  Public IP (EC2)                     54.147.130.125
  ----------------------------------- -----------------------------------
