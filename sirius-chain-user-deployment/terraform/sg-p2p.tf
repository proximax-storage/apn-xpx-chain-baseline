module "sg_p2p" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> v3.0"

  name            = "sc-p2p"
  description     = "Security Group for the Sirius Chain P2P Nodes"
  use_name_prefix = false

  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 7900
      to_port     = 7902
      protocol    = "tcp"
      cidr_blocks = var.cidr
      description = "Sirius Chain"
    }
  ]

  ingress_with_source_security_group_id = [
    {
      rule                     = "ssh-tcp"
      source_security_group_id = module.sg_bastion.this_security_group_id
    }
  ]

  egress_rules = [
    "http-80-tcp",
    "https-443-tcp",
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 7900
      to_port     = 7902
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Sirius Chain"
    }
  ]

  tags = {
    Project     = var.tag_project_name
    Terraform   = true
  }
}
