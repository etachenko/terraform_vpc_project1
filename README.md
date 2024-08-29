# Terraform VPC Project

This project sets up a Virtual Private Cloud (VPC) on AWS using Terraform. The VPC includes two public subnets, two private subnets, an internet gateway, and route tables, providing a basic networking setup suitable for various cloud applications.

## Project Structure

- **main.tf**: Contains the Terraform configuration for the VPC, subnets, internet gateway, and route tables.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/downloads.html)
- An AWS account with appropriate permissions to create VPCs, subnets, internet gateways, and route tables
- AWS CLI configured with your credentials

## Getting Started

1. **Clone the repository**:

    ```bash
    git clone https://github.com/yourusername/terraform-vpc.git
    cd terraform-vpc
    ```

2. **Initialize Terraform**: This command downloads the necessary provider plugins.

    ```bash
    terraform init
    ```

3. **Review the Configuration**: Make any necessary adjustments to the `main.tf` file, such as changing the region or CIDR blocks.

4. **Validate the Configuration**: Check for syntax errors or other issues.

    ```bash
    terraform validate
    ```

5. **Plan the Deployment**: See what changes Terraform will make.

    ```bash
    terraform plan
    ```

6. **Apply the Configuration**: Create the VPC and associated resources.

    ```bash
    terraform apply
    ```

    Type `yes` to confirm.

7. **Verify the Deployment**: Check your AWS console to ensure the VPC and resources have been created successfully.

## Resources Created

- **VPC**: A Virtual Private Cloud with a CIDR block of `10.0.0.0/16`.
- **Public Subnets**: Two public subnets in different availability zones (`10.0.1.0/24` and `10.0.2.0/24`).
- **Pivate Subnets**: Two private subnets in different availability zones (`10.0.3.0/24` and `10.0.4.0/24`).
- **Internet Gateway**: Allows traffic from the VPC to access the internet.
- **Route Table**: Routes internet-bound traffic from the public subnets through the internet gateway.

## Cleaning Up

To destroy the VPC and all related resources, run:

```bash
terraform destroy

Type yes to confirm.

## Customization
You can customize the following parameters in the main.tf file:

Region: Change the AWS region where the VPC will be created.
CIDR Blocks: Adjust the CIDR blocks for the VPC and subnets as needed.
Availability Zones: Modify the availability zones for the subnets.

