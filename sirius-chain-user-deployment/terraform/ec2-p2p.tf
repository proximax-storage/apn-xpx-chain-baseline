module "ec2_p2p" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "sc-p2p"

  ami            = var.p2p_ami
  instance_type  = var.p2p_instance_type
  instance_count = var.p2p_instance_count

  disable_api_termination     = true
  associate_public_ip_address = false
  key_name                    = var.key_name

  vpc_security_group_ids = [ module.sg_p2p.this_security_group_id ]

  subnet_ids = module.vpc.private_subnets

  iam_instance_profile = aws_iam_instance_profile.sc.name

  root_block_device = [
    {
      volume_type = var.p2p_ebs_type
      volume_size = var.p2p_ebs_size
    }
  ]

  tags = {
    Terraform = true
    Project   = var.tag_project_name
  }
}
