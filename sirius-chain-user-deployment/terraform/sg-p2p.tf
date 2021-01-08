module "sg_p2p" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> v3.0"

  name            = "sirius-chain-p2p"
  description     = "Security Group for the Sirius Chain P2P Nodes"
  use_name_prefix = false

  vpc_id = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 7900
      to_port     = 7902
      protocol    = "tcp"
      cidr_blocks = var.ingress_cidr
      description = "Sirius Chain"
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
    Project   = var.tag_project_name
    Terraform = true
  }
}
