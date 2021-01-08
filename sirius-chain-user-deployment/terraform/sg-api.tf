module "sg_api" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> v3.0"

  name            = "sc-api"
  description     = "Security Group for the Sirius Chain API Nodes"
  use_name_prefix = false

  vpc_id = module.vpc.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 7900
      to_port     = 7902
      protocol    = "tcp"
      cidr_blocks = var.cidr
      description = "Sirius Chain"
    },
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = var.cidr
      description = "Sirius Chain REST"
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