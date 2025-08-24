# Provisioning an AWS EMR Cluster with Terraform

A production‑ready Terraform configuration that provisions an **Amazon EMR cluster** and **all required infrastructure** end‑to‑end. 

---

## What this repository creates

**Networking**

* VPC with CIDR (configurable)
* Public & private subnets across AZs
* Internet Gateway
* Route tables & associations

**Security**

* Security groups for EMR master and core/task nodes (SSH, web UIs, ephemeral ports)

**Storage & Logging**

* S3 bucket(s) for EMR logs, bootstrap scripts, and artifacts

**Identity & Access**

* IAM roles and instance profiles for EMR service and EMR EC2 nodes
* Least‑privilege policies for S3, CloudWatch, and autoscaling

**EMR Cluster**

* EMR release (e.g., `emr-6.x`), applications (Spark, Hive, Hadoop, Livy, Tez – configurable)
* Master + Core (and optional Task) node groups

---

## Prerequisites

* **Terraform** ≥ 1.5
* **AWS CLI** configured (credentials & default region)
* An **SSH key pair** if you want shell access to EMR nodes

---

## Quick start

```bash
# 1) Copy/adjust variables\ ncp terraform.tfvars.example terraform.tfvars

# 2) Initialize providers & modules
terraform init

# 3) See the execution plan
terraform plan -out tfplan

# 4) Apply the changes
terraform apply tfplan
```

> The initial apply creates networking, IAM, S3, and the EMR cluster. Provisioning the cluster usually takes \~10–20 minutes depending on capacity.

