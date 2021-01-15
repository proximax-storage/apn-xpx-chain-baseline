aws_region = "us-east-1"

# tags = {
#   "Project" = "Sirius Chain"
# }

# key_name = "sirius_chain_key"

# VPC Creation
create_vpc = true
cidr = "10.0.0.0/16"
azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnets = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24"]

# Use Existing VPC
# create_vpc = false
# vpc_id = "vpc-123456"
# public_subnet_ids = ["subnet-aaaaaa", "subnet-bbbbbb", "subnet-cccccc"]
# private_subnet_ids = ["subnet-000000", "subnet-111111", "subnet-222222"] 


instance_termination_protection = false

# ALB Variables
# alb_deletion_protection = true
acm_arn = ""

api_ami = ""
api_instance_type = "t3.micro"
api_instance_count = 1
api_ebs_size = 8
api_ebs_type = "gp2"

p2p_ami = ""
p2p_instance_type = "t3.micro"
p2p_instance_count = 1
p2p_ebs_size = 8
p2p_ebs_type = "gp2"
