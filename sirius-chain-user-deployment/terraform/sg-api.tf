resource "aws_security_group" "api" {
  name        = "sirius-chain-api"
  description = "Security Group for the Sirius Chain API Nodes"

  vpc_id = var.create_vpc ? module.vpc.vpc_id : var.vpc_id

  tags = var.tags
}

resource "aws_security_group_rule" "api_ingress_alb" {
  security_group_id        = aws_security_group.api.id
  type                     = "ingress"
  from_port                = 3000
  to_port                  = 3000
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.alb.id
}

resource "aws_security_group_rule" "api_ingress_api" {
  security_group_id        = aws_security_group.api.id
  type                     = "ingress"
  from_port                = 7900
  to_port                  = 7902
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.api.id
}

resource "aws_security_group_rule" "api_ingress_p2p" {
  security_group_id        = aws_security_group.api.id
  type                     = "ingress"
  from_port                = 7900
  to_port                  = 7902
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.p2p.id
}

resource "aws_security_group_rule" "api_egress_http" {
  security_group_id = aws_security_group.api.id
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "api_egress_https" {
  security_group_id = aws_security_group.api.id
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "api_egress_api" {
  security_group_id        = aws_security_group.api.id
  type                     = "egress"
  from_port                = 7900
  to_port                  = 7902
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.api.id
}

resource "aws_security_group_rule" "api_egress_p2p" {
  security_group_id        = aws_security_group.api.id
  type                     = "egress"
  from_port                = 7900
  to_port                  = 7902
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.p2p.id
}
