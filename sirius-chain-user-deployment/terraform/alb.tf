module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> v5.0"

  name = "sirius-chain"

  load_balancer_type = "application"
  internal           = false

  enable_deletion_protection = var.alb_deletion_protection

  vpc_id          = var.create_vpc ? module.vpc.vpc_id : var.vpc_id
  subnets         = var.create_vpc ? module.vpc.public_subnet_ids : var.public_subnet_ids
  security_groups = [aws_security_group.alb.id]

  target_groups = [
    {
      name             = "sirius-chain-api"
      backend_protocol = "HTTP"
      backend_port     = 3000
      target_type      = "instance"
    }
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = var.acm_arn
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = var.tags
}

resource "aws_lb_target_group_attachment" "api" {
  count            = var.api_instance_count
  target_group_arn = module.alb.target_group_arns[0]
  target_id        = element(module.ec2_api.id, count.index)
  port             = 3000
}
