
# AWS EKS Terraform Deployment

This project provisions an **Amazon EKS (Elastic Kubernetes Service)** cluster on AWS using **modular Terraform code**. It emphasizes scalability, reusability, and cloud best practices including remote state management via S3.

---

## Project Structure

```bash
.
├── main.tf                # Root configuration to call all modules
├── provider.tf           # AWS provider configuration
├── terraform.tfvars      # Variable values used by Terraform
├── variables.tf          # Variable declarations
├── README.md             # This file
├── s3-backend/           # Terraform backend (S3 + DynamoDB)
│   ├── main.tf
│   ├── variables.tf
│   ├── provider.tf
│   └── output.tf
└── modules/              # All reusable infrastructure modules
    ├── eks/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── output.tf
    ├── iam/
    │   ├── main.tf
    │   └── output.tf
    ├── security_group/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── output.tf
    └── vpc/
        ├── main.tf
        ├── variables.tf
        └── output.tf
```

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/Here2ServeU/aws-eks-terraform.git
cd aws-eks-terraform/
```

### 2. Create Backend for Remote State

Navigate to the `s3-backend/` directory and deploy your remote backend:

```bash
cd s3-backend/
terraform init
terraform plan
terraform apply
```

> This will create an S3 bucket (and optionally a DynamoDB table) to store the remote Terraform state.

---

### 3. Deploy EKS Infrastructure

Return to the root directory and run the following:

```bash
cd ..
terraform init
terraform plan
terraform apply
```

This will provision:

- A VPC with private and public subnets
- Security groups for EKS control plane and worker nodes
- IAM roles and policies for EKS and node groups
- An EKS cluster with managed node groups
- Container image deployment from ECR

---

## Configuration

Set values in `terraform.tfvars` to customize your environment:

```hcl
region              = "us-east-1"
cluster_name        = "t2s-eks-cluster"
cluster_version     = "1.29"
vpc_id              = "vpc-xxxxx"
subnet_ids          = ["subnet-abc123", "subnet-def456"]
image_url           = "your-ecr-url"
image_tag           = "latest"
container_name      = "t2s-container"
container_port      = 3000
```

---

## Clean Up

To destroy all resources created:

```bash
terraform destroy
```

---

## Prerequisites

- [Terraform 1.6+](https://developer.hashicorp.com/terraform/downloads)
- AWS CLI configured (`aws configure`)
- IAM permissions to create VPCs, EKS, IAM, EC2, and S3 resources

---

## Notes

- Use the `modules/` directory to update any specific infrastructure logic (e.g., add new node group types, enable encryption, etc.).
- Backend configuration (`s3-backend/`) should be created once and reused for all Terraform workspaces or environments.

---

## Author

**Dr. Emmanuel Naweji**  
Cloud | DevOps | SRE | AI | Founder of T2S | [LinkedIn](https://www.linkedin.com/in/ready2assist/)

---

## Architecture Overview

![EKS Architecture](./eks.png)
