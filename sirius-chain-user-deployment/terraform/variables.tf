#============================
# General Variables
#============================
variable "aws_region" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "key_name" {
  type    = string
  default = ""
}

#============================
# VPC Deployment Variables
#============================
variable "create_vpc" {
  type = bool
}

variable "cidr" {
  type = string
}

variable "azs" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

#============================
# Existing VPC Variables
#============================
variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

#============================
# ALB Variables
#============================
variable "alb_deletion_protection" {
  type    = bool
  default = false
}

variable "acm_arn" {
  type = string
}

#============================
# Sirius Chain API Variables
#============================

variable "api_ami" {
  type = string
}

variable "api_instance_type" {
  type = string
}

variable "api_instance_count" {
  type    = number
  default = 1
}

variable "api_ebs_size" {
  type    = number
  default = 20
}

variable "api_ebs_type" {
  type    = string
  default = "gp2"
}

#============================
# Sirius Chain P2P Variables
#============================

variable "p2p_ami" {
  type = string
}

variable "p2p_instance_type" {
  type = string
}

variable "p2p_instance_count" {
  type    = number
  default = 3
}

variable "p2p_ebs_size" {
  type    = number
  default = 20
}

variable "p2p_ebs_type" {
  type    = string
  default = "gp2"
}
