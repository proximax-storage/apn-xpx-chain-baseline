module "sg_alb" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> v3.0"

  name            = "sirius-chain-alb"
  description     = "Security Group for the Sirius Chain Application Load Balancer"
  use_name_prefix = false

  vpc_id = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      description = "Sirius Chain REST"
    }
  ]

  egress_rules = [
    "http-80-tcp",
    "https-443-tcp",
  ]

  tags = {
    Project   = var.tag_project_name
    Terraform = true
  }
}
