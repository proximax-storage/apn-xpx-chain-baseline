# Sirius Chain Terraform

## Required IAM Permissions

### Deployment

#### VPC Deployment

* ec2:AssociateRouteTable
* ec2:AttachInternetGateway
* ec2:CreateInternetGateway
* ec2:CreateNatGateway
* ec2:CreateRoute
* ec2:CreateRouteTable
* ec2:CreateSubnet
* ec2:CreateTags
* ec2:CreateVpc
* ec2:DescribeAddresses
* ec2:DescribeInternetGateways
* ec2:DescribeNatGateways
* ec2:DescribeNetworkAcls
* ec2:DescribeRouteTables
* ec2:DescribeSubnets
* ec2:DescribeTags
* ec2:DescribeVpcAttribute
* ec2:DescribeVpcClassicLink
* ec2:DescribeVpcClassicLinkDnsSupport
* ec2:DescribeVpcs
* ec2:ModifySubnetAttribute
* ec2:ModifyVpcAttribute


#### Instance Deployment

* iam:AddRoleToInstanceProfile
* iam:AttachRolePolicy
* iam:CreateInstanceProfile
* iam:CreateRole
* iam:GetInstanceProfile
* iam:GetRole
* iam:ListAttachedRolePolicies

* ec2:AuthorizeSecurityGroupEgress
* ec2:AuthorizeSecurityGroupIngress
* ec2:CreateSecurityGroup
* ec2:DescribeImages
* ec2:DescribeInstanceAttribute
* ec2:DescribeInstanceCreditSpecifications
* ec2:DescribeInstances
* ec2:DescribeSecurityGroups
* ec2:DescribeSubnets
* ec2:DescribeTags
* ec2:DescribeVolumes
* ec2:DescribeVpcs
* ec2:RevokeSecurityGroupEgress
* ec2:RunInstances

* elasticloadbalancing:AddTags
* elasticloadbalancing:CreateListener
* elasticloadbalancing:CreateLoadBalancer
* elasticloadbalancing:CreateTargetGroup
* elasticloadbalancing:DescribeListeners
* elasticloadbalancing:DescribeLoadBalancers
* elasticloadbalancing:DescribeTags
* elasticloadbalancing:DescribeTargetGroupAttributes
* elasticloadbalancing:DescribeTargetGroups
* elasticloadbalancing:ModifyLoadBalancerAttributes
* elasticloadbalancing:ModifyTargetGroupAttributes
* elasticloadbalancing:RegisterTargets
* elasticloadbalancing:SetIpAddressType
* elasticloadbalancing:SetSecurityGroups

### Operations

* iam:GetInstanceProfile
* iam:GetRole
* iam:ListAttachedRolePolicies

* ec2:DescribeInstances
* ec2:DescribeSecurityGroups
* ec2:DescribeTags
* ec2:DescribeVolumes

* elasticloadbalancing:DescribeListeners
* elasticloadbalancing:DescribeLoadBalancers
* elasticloadbalancing:DescribeTags
* elasticloadbalancing:DescribeTargetGroupAttributes
* elasticloadbalancing:DescribeTargetGroups

* ssm:DescribeInstanceInformation
* ssm:DescribeInstanceProperties
* ssm:DescribeSessions
* ssm:GetConnectionStatus
* ssm:SendCommand
* ssm:StartSession
* ssm:TerminateSession
