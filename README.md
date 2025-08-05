 Golden AMI Creation with Packer & AWS
This project automates the creation of a secure and production-ready AMI using HashiCorp Packer. The AMI includes essential tools like SSM Agent and CloudWatch Agent, and can be used across EC2, Auto Scaling Groups, or EKS.
 Tools & Tech
Packer
AWS EC2, AMI, KMS, SSM
Bash Scripts
Ubuntu 24.04 LTS



 Project Structure
.
├── ubuntu.pkr.hcl        # Main Packer template
├── variables.pkr.hcl     # Input variables
├── scripts/              # Install & validate scripts
└── README.md

 Quick Start
packer init .
packer build -var-file="variables.pkr.hcl" ubuntu.pkr.hcl


 Features
 Hardened AMI (IMDSv2, password auth disabled)
 Encrypted EBS (gp3)
 SSM & CloudWatch Agents pre-installed
 AMI ID output to SSM Parameter Store



 Use Cases
Auto Scaling Launch Templates
CI/CD Build Hosts
ECS / EKS Base Nodes
Image Pipelines


Author
Ashish Singh
 DevOps | AWS | Terraform | GitHub Actions
