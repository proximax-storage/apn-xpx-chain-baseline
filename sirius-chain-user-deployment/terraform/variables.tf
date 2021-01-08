# common vars

variable "aws_region" {
  type = string
}

variable "key_name" {
  description = "Name of EC2 Keypair"
  type        = string
  default     = ""
}

variable "tag_project_name" {
  type    = string
  default = "Sirius Chain"
}

variable "instance_termination_protection" {
  type    = bool
  default = false
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "ingress_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

# elastic load balancer
variable "deploy_elb" {
  type    = bool
  default = true
}

variable "elb_subnets" {
  type = list(string)
}

variable "elb_termination_protection" {
  type    = bool
  default = false
}

# sirius chain api node vars

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

variable "api_associate_public_ip" {
  type    = bool
  default = false
}

# sirius chain p2p node vars

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

variable "p2p_associate_public_ip" {
  type    = bool
  default = false
}
