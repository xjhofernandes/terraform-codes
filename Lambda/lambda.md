## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.27 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.74.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.iam_for_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.container_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ambiente"></a> [ambiente](#input\_ambiente) | Ambiente que ocorrerá a aplicação. Dev ou Prod | `string` | `"dev"` | no |
| <a name="input_image_uri"></a> [image\_uri](#input\_image\_uri) | URI da imagem no ECR | `string` | `"607329366285.dkr.ecr.us-east-1.amazonaws.com/tg-chuva:v0.1.4-dev"` | no |
| <a name="input_lamba_iam_name"></a> [lamba\_iam\_name](#input\_lamba\_iam\_name) | Nome IAM responsável pela Lambda | `string` | `"tg-dev-role-chuva-2"` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | n/a | `string` | `"tg-terraform-teste"` | no |
| <a name="input_lambda_memory_size"></a> [lambda\_memory\_size](#input\_lambda\_memory\_size) | n/a | `number` | `1024` | no |
| <a name="input_lambda_policies_arn"></a> [lambda\_policies\_arn](#input\_lambda\_policies\_arn) | n/a | `list(string)` | <pre>[<br>  "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole",<br>  "arn:aws:iam::aws:policy/AmazonS3FullAccess",<br>  "arn:aws:iam::aws:policy/SecretsManagerReadWrite"<br>]</pre> | no |
| <a name="input_lambda_security_groups"></a> [lambda\_security\_groups](#input\_lambda\_security\_groups) | n/a | `list(string)` | <pre>[<br>  "sg-02ae531e1858d9dc4"<br>]</pre> | no |
| <a name="input_lambda_subnets"></a> [lambda\_subnets](#input\_lambda\_subnets) | n/a | `list(string)` | <pre>[<br>  "subnet-0bc83f659ff0ced1e",<br>  "subnet-03dedc8751d424518"<br>]</pre> | no |
| <a name="input_lambda_timeout"></a> [lambda\_timeout](#input\_lambda\_timeout) | n/a | `number` | `300` | no |

## Outputs

No outputs.
