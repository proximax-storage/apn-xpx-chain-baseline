module "ec2_p2p" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> v2.0"

  name = "sirius-chain-p2p"

  ami            = var.p2p_ami
  instance_type  = var.p2p_instance_type
  instance_count = var.p2p_instance_count

  disable_api_termination = var.instance_termination_protection
  key_name                = var.key_name

  vpc_security_group_ids = [aws_security_group.p2p.id]

  subnet_ids = var.create_vpc ? module.vpc.private_subnets : var.private_subnet_ids

  iam_instance_profile = aws_iam_instance_profile.sc.name

  root_block_device = [
    {
      volume_type = var.p2p_ebs_type
      volume_size = var.p2p_ebs_size
    }
  ]

  metadata_options = {
    http_tokens = "required"
  }
    
  tags = var.tags
}
