module "sc_api_ext_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> v5.0"

  name = "sirius-chain-api"

  load_balancer_type = "application"
  internal           = false

  enable_deletion_protection = var.elb_termination_protection

  vpc_id          = var.vpc_id
  subnets         = var.elb_subnets
  security_groups = [module.sg_alb.this_security_group_id]


  target_groups = [
    {
      name             = "sirius-chain-api"
      backend_protocol = "HTTP"
      backend_port     = 3000
      target_type      = "instance"
    }
  ]

  http_tcp_listeners = [
    {
      port               = 3000
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = {
    Project   = var.tag_project_name
    Terraform = true
  }
}

# Instance Target to Target Group Association
resource "aws_lb_target_group_attachment" "sc_api_target_assoc" {
  count            = var.api_instance_count
  target_group_arn = module.sc_api_ext_alb.target_group_arns[0]
  target_id        = element(module.ec2_api.id, count.index)
  port             = 3000
}
