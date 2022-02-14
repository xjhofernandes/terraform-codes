resource "aws_lambda_function" "container_lambda" {
  function_name = local.lambda.function_name
  image_uri     = local.lambda.image_uri

  role          = aws_iam_role.iam_for_lambda.arn
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
    null_resource.docker_runner
  ]
}
