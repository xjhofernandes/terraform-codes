resource "aws_lambda_function" "container_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.iam_for_lambda.arn

  image_uri     = var.image_uri
  architectures = ["x86_64"]
  memory_size = var.lambda_memory_size
  timeout = var.lambda_timeout
  package_type  = "Image"

  environment {
    variables = {
      ENV = var.ambiente
    }
  }

  vpc_config {
    subnet_ids         = var.lambda_subnets
    security_group_ids = var.lambda_security_groups
  }  

  depends_on = [
    aws_iam_role.iam_for_lambda,
    aws_iam_role_policy_attachment.lambda_policies,
  ]
}
