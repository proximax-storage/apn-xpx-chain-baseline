
resource "aws_iam_role" "bastion" {
  name               = "bastion"
  path               = "/system/"
  description        = "Role for Bastion instances"
  assume_role_policy = data.aws_iam_policy_document.ec2_assumerole.json
}

resource "aws_iam_role_policy_attachment" "bastion_ssm" {
  role       = aws_iam_role.bastion.name
  policy_arn = data.aws_iam_policy.ssm_core.arn
}

resource "aws_iam_instance_profile" "bastion" {
  name = "bastion"
  role = aws_iam_role.bastion.name
}
