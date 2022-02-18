variable "lambda_policies_arn" {
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole", # VPC - Lambda
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",                           # S3 - Lambda
    "arn:aws:iam::aws:policy/SecretsManagerReadWrite"                       # Secrets - Lambda
  ]
}
