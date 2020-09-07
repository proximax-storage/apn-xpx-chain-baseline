
resource "aws_iam_role" "sc" {
  name               = "sc"
  path               = "/system/"
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
