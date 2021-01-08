# TODO: Change AWS Region

aws_region = "ap-south-1"
vpc_id = ""
subnet_ids = [""]

instance_termination_protection = false

deploy_elb = true
elb_subnets = [""]
elb_termination_protection = false

api_ami = "ami-02240fe5e8581a077"
api_instance_type = "t3a.micro"
api_instance_count = 1
api_ebs_size = 8
api_ebs_type = "gp3"
api_associate_public_ip = false

p2p_ami = "ami-02240fe5e8581a077"
p2p_instance_type = "t3a.micro"
p2p_instance_count = 1
p2p_ebs_size = 8
p2p_ebs_type = "gp3"
p2p_associate_public_ip = false
