module "ec2_api" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> v2.0"

  name = "sc-api"

  ami            = var.api_ami
  instance_type  = var.api_instance_type
  instance_count = var.api_instance_count

  disable_api_termination     = true
  associate_public_ip_address = false
  key_name                    = var.key_name

  vpc_security_group_ids = [module.sg_api.this_security_group_id]

  subnet_ids = module.vpc.private_subnets

  iam_instance_profile = aws_iam_instance_profile.sc.name

  root_block_device = [
    {
      volume_type = var.api_ebs_type
      volume_size = var.api_ebs_size
    }
  ]

  tags = {
    Terraform = true
    Project   = var.tag_project_name
  }
}
