# common vars

variable "aws_region" {
  type        = string
}

variable "key_name" {
  description = "Name of EC2 Keypair"
  type        = string
}

variable "tag_project_name" {
  type = string
}

variable "tf_state_bucket_name" {
  description = "Name of S3 Bucket for Terraform State"
  type        = string
}

variable "tf_state_key_name" {
  description = "Key Name for Terraform State"
  type        = string
}

# vpc vars

variable "cidr" {
  type        = string
}

variable "azs" {
  description = "AZs to deploy VPC"
  type        = list(string)
}

variable "private_subnets" {
  type        = list(string)
}

variable "public_subnets" {
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable creation of NAT Gateway"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Create a single NAT Gateway"
  type        = bool
}

variable "one_nat_gateway_per_az" {
  description = "Create a single NAT Gateway per AZ"
  type        = bool
}

# bastion vars

variable "bastion_ami_id" {
  type        = string
}

variable "bastion_instance_type" {
  type        = string
}

# sirius chain api node vars

variable "api_ami" {
  type = string
}

variable "api_instance_type" {
  type = string
}

variable "api_instance_count" {
  type = number
}

variable "api_ebs_size" {
  type = number
}

variable "api_ebs_type" {
  type = string
}

# sirius chain p2p node vars

variable "p2p_ami" {
  type = string
}

variable "p2p_instance_type" {
  type = string
}

variable "p2p_instance_count" {
  type = number
}

variable "p2p_ebs_size" {
  type = number
}

variable "p2p_ebs_type" {
  type = string
}
