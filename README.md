# AWS Infrastructure Automation with Terraform - PROG 8870 Final Project

This project demonstrates the deployment of AWS infrastructure using Terraform for the PROG 8870 - Cloud Architectures and Infrastructure as Code course at Conestoga College.

## Project Overview

The project implements a scalable AWS infrastructure with the following components:
- S3 bucket for Terraform state storage with versioning enabled
- Custom VPC with public subnet
- EC2 instance with security groups
- Internet Gateway and Route Table configuration
- DynamoDB table for state locking (Extra Credit)

## Implementation Screenshots

Screenshots demonstrating the successful implementation are stored in the `screenshots` directory:
- `ec2_instance.png`: Running EC2 instance in AWS Console
- `terraform_apply.png`: Terminal output of successful Terraform apply
- `s3_bucket.png`: S3 bucket showing the Terraform state file
- `dynamodb_table.png`: DynamoDB table for state locking

## Prerequisites

1. AWS Account Setup:
   - Active AWS account with appropriate permissions
   - AWS CLI installed and configured
   - AWS credentials configured (`aws configure`)

2. Local Environment:
   - Terraform installed (version >= 1.0.0)
   - Git installed
   - Terminal or command prompt access

## Project Structure

```
.
├── main.tf          # Main infrastructure configuration
├── variables.tf     # Variable definitions
├── terraform.tfvars # Variable values
├── backend.tf       # S3 backend configuration
├── screenshots/     # Implementation screenshots
└── README.md       # Project documentation
```

## Infrastructure Components

### 1. S3 Bucket
- Name: "final-project-terraform-state-8870"
- Purpose: Terraform state storage
- Features:
  - Versioning enabled
  - Encryption enabled
  - Prevent accidental deletion

### 2. VPC and Networking
- Custom VPC (CIDR: 10.0.0.0/16)
- Public Subnet (CIDR: 10.0.1.0/24)
- Internet Gateway
- Route Table with internet access

### 3. EC2 Instance
- Type: t2.micro (Free tier eligible)
- AMI: Amazon Linux 2023
- Security Group Rules:
  - SSH (Port 22)
  - HTTP (Port 80)
  - HTTPS (Port 443)

### 4. DynamoDB Table (Extra Credit)
- Purpose: Terraform state locking
- Prevents concurrent state modifications

## Deployment Steps

1. Clone the repository:
   ```bash
   git clone https://github.com/joseph8951790/Final_Project_IAC.git
   cd Final_Project_IAC
   ```

2. Initialize Terraform with local backend:
   ```bash
   terraform init
   ```

3. Create S3 bucket and initial infrastructure:
   ```bash
   terraform plan
   terraform apply
   ```

4. Switch to S3 backend:
   ```bash
   # Update backend.tf to use S3
   terraform init -migrate-state
   ```

5. Verify resources in AWS Console:
   - Check EC2 instance status
   - Verify S3 bucket and state file
   - Confirm security group rules
   - Test network connectivity

## Best Practices Implemented

1. State Management
   - Remote state storage in S3
   - State file encryption
   - Version control for state files
   - State locking with DynamoDB

2. Security
   - Minimal security group rules
   - VPC isolation
   - Public subnet for web access
   - Encrypted state storage

3. Code Organization
   - Modular configuration
   - Variable usage for flexibility
   - Clear resource naming
   - Comprehensive documentation

## Cleanup Instructions

To avoid unwanted AWS charges, destroy the infrastructure when not needed:
```bash
terraform destroy
```

## Troubleshooting

Common issues and solutions:
1. S3 bucket name conflicts:
   - Ensure unique bucket name in terraform.tfvars

2. AWS credentials:
   - Verify AWS CLI configuration
   - Check IAM permissions

3. State migration:
   - Confirm S3 bucket exists before backend migration
   - Verify correct bucket name in backend.tf

## Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [AWS Free Tier](https://aws.amazon.com/free)
- [AWS CLI Configuration](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)

## Author

Joseph Vettamthadathil
Student ID: 8951790
PROG 8870 - Cloud Architectures and Infrastructure as Code
Conestoga College
