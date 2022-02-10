variable "ambiente" {
  description = "Ambiente que ocorrerá a aplicação. Dev ou Prod"
  type        = string
  default     = "dev"
}


variable "image_uri" {
  description = "URI da imagem no ECR"
  type        = string
  default     = "607329366285.dkr.ecr.us-east-1.amazonaws.com/tg-chuva:v0.1.4-dev"
}


variable "lambda_function_name" {
  default = "tg-terraform-teste"
}


variable "lamba_iam_name" {
  description = "Nome IAM responsável pela Lambda"
  type        = string
  default     = "tg-dev-role-chuva-2"
}


variable "lambda_subnets" {
  type    = list(string)
  default = ["subnet-0bc83f659ff0ced1e", "subnet-03dedc8751d424518"]
}


variable "lambda_security_groups" {
  type    = list(string)
  default = ["sg-02ae531e1858d9dc4"]
}


variable "lambda_policies_arn" {
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole", # VPC - Lambda
    "arn:aws:iam::aws:policy/AmazonS3FullAccess", # S3 - Lambda
    "arn:aws:iam::aws:policy/SecretsManagerReadWrite" # Secrets - Lambda
  ]
}


variable "lambda_memory_size" {
  type = number
  default = 1024
}


variable "lambda_timeout" {
  type = number
  default = 300
}

