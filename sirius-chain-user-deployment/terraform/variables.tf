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

variable "instance_termination_protection" {
  type    = bool
  default = false
}

#============================
# VPC Deployment Variables
#============================
variable "create_vpc" {
  type    = bool
  default = true
}

variable "cidr" {
  type    = string
  default = ""
}

variable "azs" {
  type    = list(string)
  default = []
}

variable "public_subnets" {
  type    = list(string)
  default = []
}

variable "private_subnets" {
  type    = list(string)
  default = []
}

#============================
# Existing VPC Variables
#============================
variable "vpc_id" {
  type    = string
  default = ""
}

variable "public_subnet_ids" {
  type    = list(string)
  default = []
}

variable "private_subnet_ids" {
  type    = list(string)
  default = []
}

#============================
# ALB Variables
#============================
variable "alb_deletion_protection" {
  type    = bool
  default = false
}

variable "acm_arn" {
  type    = string
  default = ""
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
