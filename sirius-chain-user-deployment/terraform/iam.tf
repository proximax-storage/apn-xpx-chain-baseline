# Policy for EC2 to Assume Roles
data "aws_iam_policy_document" "ec2_assumerole" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# AWS-managed SSM Policy
data "aws_iam_policy" "ssm_core" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Instance Role for EC2 Instances
resource "aws_iam_role" "sc" {
  name               = "sirius-chain"
  path               = "/"
  description        = "Role for Sirius Chain instances"
  assume_role_policy = data.aws_iam_policy_document.ec2_assumerole.json
}

resource "aws_iam_role_policy_attachment" "sc_ssm" {
  role       = aws_iam_role.sc.name
  policy_arn = data.aws_iam_policy.ssm_core.arn
}

resource "aws_iam_instance_profile" "sc" {
  name = "sirius-chain"
  role = aws_iam_role.sc.name
}
