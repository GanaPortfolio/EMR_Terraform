variable "name" {}
variable "region" {}
variable "subnet_cidr" {
  type = string
}
variable "bucket_name" {}
variable "subnet_az" {}
variable "release_label" {}
variable "applications" {
  type = list(string)
}
variable "vpc_cidr" {
  type = string
}
variable "master_instance_type" {}
variable "master_ebs_size" {}
variable "core_instance_type" {}
variable "core_instance_count" {}
variable "core_ebs_size" {}
variable "ingress_cidr_blocks" {}
variable "cidr_block" {}

