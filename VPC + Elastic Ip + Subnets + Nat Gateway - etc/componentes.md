### Gerado por https://github.com/terraform-docs/terraform-docs

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
| [aws_eip.natg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.dev](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_main_route_table_association.prv](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/main_route_table_association) | resource |
| [aws_nat_gateway.natg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_network_interface.natg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |
| [aws_route_table.natg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.prv](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.pub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.natg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.prv](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.pub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.natg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.prv](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.pub](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subn_natg"></a> [subn\_natg](#input\_subn\_natg) | Configuração da subnet natg | <pre>list(object({<br>    name       = string<br>    cidr_block = string<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_block": "10.0.6.0/24",<br>    "name": "tg-dev-subn-natg-terraform-0-a"<br>  },<br>  {<br>    "cidr_block": "10.0.7.0/24",<br>    "name": "tg-dev-subn-natg-terraform-0-b"<br>  },<br>  {<br>    "cidr_block": "10.0.8.0/24",<br>    "name": "tg-dev-subn-natg-terraform-0-c"<br>  }<br>]</pre> | no |
| <a name="input_subn_prv"></a> [subn\_prv](#input\_subn\_prv) | Configuração da subnet privada | <pre>list(object({<br>    name       = string<br>    cidr_block = string<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_block": "10.0.3.0/24",<br>    "name": "tg-dev-subn-prv-terraform-0-a"<br>  },<br>  {<br>    "cidr_block": "10.0.4.0/24",<br>    "name": "tg-dev-subn-prv-terraform-0-b"<br>  },<br>  {<br>    "cidr_block": "10.0.5.0/24",<br>    "name": "tg-dev-subn-prv-terraform-0-c"<br>  }<br>]</pre> | no |
| <a name="input_subn_pub"></a> [subn\_pub](#input\_subn\_pub) | Configuração da subnet publica | <pre>list(object({<br>    name       = string<br>    cidr_block = string<br>  }))</pre> | <pre>[<br>  {<br>    "cidr_block": "10.0.0.0/24",<br>    "name": "tg-dev-subn-pub-terraform-0-a"<br>  },<br>  {<br>    "cidr_block": "10.0.1.0/24",<br>    "name": "tg-dev-subn-pub-terraform-0-b"<br>  },<br>  {<br>    "cidr_block": "10.0.2.0/24",<br>    "name": "tg-dev-subn-pub-terraform-0-c"<br>  }<br>]</pre> | no |

## Outputs

No outputs.
