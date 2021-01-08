# TODO: Change IPs

cidr = "10.41.0.0/16"
azs  = [
  "ap-south-1a",
  "ap-south-1b",
  "ap-south-1c",
]

public_subnets = [
  "10.41.0.0/19",
  "10.41.32.0/19",
  "10.41.64.0/19",
]
private_subnets  = [
  "10.41.96.0/19",
  "10.41.128.0/19",
  "10.41.160.0/19",
]

enable_nat_gateway     = true
single_nat_gateway     = true
one_nat_gateway_per_az = false
