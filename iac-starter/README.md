# IaC Starter Kit

A production-ready Infrastructure-as-Code starter kit for AWS. This kit provides a solid foundation for deploying a full-stack application (React frontend, Node.js backend, PostgreSQL) on AWS EKS using Terraform.

## Project Structure

```text
/iac-starter
├── .github/workflows/    # CI/CD pipelines
│   └── deploy.yml        # Build and deploy to EKS
├── terraform/            # Infrastructure as Code
│   ├── main.tf           # Providers and core config
│   ├── vpc.tf            # Networking (VPC, Subnets, NAT)
│   ├── eks.tf            # Kubernetes Cluster (EKS)
│   ├── rds.tf            # Database (RDS PostgreSQL)
│   ├── variables.tf      # Configuration variables
│   └── outputs.tf        # Resource outputs
├── k8s/                  # Kubernetes manifests
│   ├── frontend.yaml     # Deployment and Service for React
│   ├── backend.yaml      # Deployment and Service for Node.js
│   └── ingress.yaml      # ALB Ingress configuration
└── README.md             # This guide
```

## Prerequisites

- [Terraform](https://www.terraform.io/downloads) (v1.0.0+)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate permissions
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- A GitHub repository with the following secrets:
  - `AWS_ACCESS_KEY_ID`
  - `AWS_SECRET_ACCESS_KEY`

## Setup Steps

### 1. Provision Infrastructure

Navigate to the `terraform` directory and initialize:

```bash
cd terraform
terraform init
```

Create a `terraform.tfvars` file to provide the database password:

```hcl
db_password = "your-secure-password"
aws_region  = "us-east-1"
```

Apply the configuration:

```bash
terraform apply
```

### 2. Configure Kubernetes

Once the EKS cluster is ready, update your local kubeconfig:

```bash
aws eks update-kubeconfig --name iac-starter-eks --region us-east-1
```

### 3. Deploy Applications

The CI/CD pipeline in `.github/workflows/deploy.yml` is configured to run on every push to the `main` branch. Ensure your `frontend` and `backend` directories (with their respective Dockerfiles) are present at the root.

To manually apply the manifests:

```bash
kubectl apply -f k8s/
```

## Architecture Notes

- **Network**: The VPC uses public subnets for the Load Balancer and private subnets for EKS Nodes and the RDS Database.
- **Security**: The database is only accessible from within the EKS cluster security group.
- **Scaling**: EKS Node Group is configured to scale between 1 and 3 instances.
