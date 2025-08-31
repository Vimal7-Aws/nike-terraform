# Terraform AWS Infrastructure with ECS

This project provisions a complete AWS infrastructure using Terraform in a **modular structure**.  
It includes **VPC, subnets, Internet Gateway, NAT Gateway, route tables, NACLs, security groups, EC2 instances (public & private), and an ECS cluster with an Application Load Balancer (ALB).**

---

## 📂 Project Structure

```bash
terraform_project/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── vpc/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── subnets/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── nat/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── route_tables/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── nacl/
│   ├── main.tf
│   └── variables.tf
├── sg/
│   ├── main.tf
│   └── variables.tf
├── ec2/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
└── ecs/
    ├── main.tf
    ├── variables.tf
    └── outputs.tf




🚀 Deployment

Run the following commands:

terraform init
terraform plan -var-file=terraform.tfvars
terraform apply -var-file=terraform.tfvars -auto-approve
