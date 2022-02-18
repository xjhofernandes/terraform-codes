locals {
  api_gateway = {
    "description" = "API Gerada atráves do Terraform."
  }
  lambda = {
    "image_uri"     = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${data.aws_region.current.name}.amazonaws.com/${basename(abspath("../"))}:latest"
    "function_name" = "${basename(abspath("../"))}"
  }
  iam = {
    name = "tg-${var.ambiente}-${basename(abspath("../"))}"
  }
  subnets = [
    "tg-${var.ambiente}-subn-${var.tipo_vpc}-0-a",
    "tg-${var.ambiente}-subn-${var.tipo_vpc}-0-b",
    "tg-${var.ambiente}-subn-${var.tipo_vpc}-0-c"
  ]
  security_group = "tg-${var.ambiente}-sg-default"
}
