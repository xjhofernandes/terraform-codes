variable "ambiente" {
  description = "Ambiente que ocorrerá a aplicação. Dev ou Prod"
  type        = string
  default     = "dev"
}


locals{
  lambda = {
    "image_uri" = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${basename(abspath("../"))}:latest"
    "function_name" = "${basename(abspath("../"))}"
  }
  iam = {
    name = "tg-${var.ambiente}-${basename(abspath("../"))}"
  }

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
  default = 128
}


variable "lambda_timeout" {
  type = number
  default = 300
}

variable "region" {
  default = "us-east-1"
}
