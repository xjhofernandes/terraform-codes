resource "aws_iam_role" "iam_for_lambda" {
  name = var.lamba_iam_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}


resource "aws_iam_role_policy_attachment" "lambda_policies" {
  for_each = toset(var.lambda_policies_arn)
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = each.value
}
