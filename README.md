# Sample Terraform Script for Deploying Solace PubSub+ Event Broker in AWS
## Before you start
You need an AWS account and be aware that **applying this template may incure charges to your AWS account**.

## Pre-requisite
1. Create Keypair in your AWS EC2
2. Review the [Solace Software Event Broker Default Ports](https://docs.solace.com/Configuring-and-Managing/Default-Port-Numbers.htm#Software) and create Security Group in your AWS EC2
3. Create terraform variable file: `terraform.tfvars`. See the sample file [terraform_tfvars.sample](terraform_tfvars.sample)

## Deploy in AWS
1. Initialize Terraform:
```
terraform init -upgrade
```
2. Review Plan:
```
terraform plan
```
3. Apply Template:
```
terraform apply [-auto-approve]
```

## Remove Instances:
```
terraform destroy
```