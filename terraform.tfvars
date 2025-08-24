# EMR general configurations
name = "spark-app"
vpc_cidr = "10.0.0.0/16" # change the ip address according to the requirement
subnet_cidr = "10.0.1.0/24"
subnet_az = "us-east-2a"
region = "us-east-2"
bucket_name = "dev-emr-logs-23082025" # to make it easy I gave a name but we can automate this too
ingress_cidr_blocks = "10.0.0.0/16"
cidr_block = "0.0.0.0/0"
release_label = "emr-5.16.0"
applications = ["Spark"]

# Master node configurations
master_instance_type = "m5.xlarge"
master_ebs_size = "50"

# Slave nodes configurations
core_instance_type = "m5.xlarge"
core_instance_count = 1
core_ebs_size = "50"

# change the instance type according to the requirement of pipelines processing