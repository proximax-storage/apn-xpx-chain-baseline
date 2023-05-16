module "ec2_api" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> v2.0"

  name = "sirius-chain-api"

  ami            = var.api_ami
  instance_type  = var.api_instance_type
  instance_count = var.api_instance_count

  disable_api_termination = var.instance_termination_protection
  key_name                = var.key_name

  vpc_security_group_ids = [aws_security_group.api.id]

  subnet_ids = var.create_vpc ? module.vpc.private_subnets : var.private_subnet_ids

  iam_instance_profile = aws_iam_instance_profile.sc.name

  root_block_device = [
    {
      volume_type = var.api_ebs_type
      volume_size = var.api_ebs_size
    }
  ]
    
  metadata_options = {
    http_tokens = "required"
  }

  tags = var.tags
}
