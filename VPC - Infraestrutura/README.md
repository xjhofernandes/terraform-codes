---
title: "\U0001F6A7 Estudos Terraform"
created: '2022-02-07T13:17:37.930Z'
modified: '2022-02-07T20:05:07.460Z'
---

## :construction: Estudos Terraform

Comandos básicos:
* **terraform init**
  * Baixa todos os pré requisitos do seu arquivo .tf em sua máquina. (Exemplo: Baixar o modulo da AWS)
* **terraform plan**
  * Realiza o planejamento das suas configurações do seu arquivo .tf. (Parecido com o git commit, antes da gente dá push. Útil para checar se há alguma informação faltante.)
* **terraform apply**
  * Aplica as configurações planejadas anterioremente (plan) e realiza o deploy dos mesmos. 
* **terraform destroy**
  * Deleta todas as alterações que o terraform subiu na nuvem. Por exemplo, deletar todas as instâncias ec2 que o "plan" planejou. **Obs: Apenas apaga tudo que foi gerado via terraform. O que já existia anteriormente na nuvem não é deletado.**
  * Também, é possível destruir apenas um dos recursos. Colocando o parametro "-target {nome_do_recurso}"

* **terraform show**
  * Mostra detalhadamente como a está a infraestrutura deployada via terraforms na nuvem. Obs: Informações obtidas via json.

### Variaveis
No Terraform é possível ter um arquivo separado apenas contendo variáveis que serão utilizadas nos arquivos de configurações (tf).

Segue um exemplo, após a criação de um arquivo "variables.tf":
```terraform
variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "novo_nome_instancia"
}
```

A variável pode ser útilizada da seguinte forma no arquivo de configuração:
```
   tags = {
     # Anteriormente Name = "Exemplo_de_nome"
     Name = var.instance_name # Atual
   }
```

Essa mesma variável pode ser alterada ou declarada no momento do "**terraform apply**", utilizando a seguinte sintaxe:

```
terraform apply -var 'instance_name=novo_nome_instancia"
```

### Saídas (Outputs)

É possível obter as informações de saída de algumas infraestruturas geradas via terraform. 
Casos de uso: Obter o id de uma instância criada via terraforms, obter o ip dessa instância dentr outros. 

Após a criação de um arquivo "outputs.tf", considere as configurações abaixo:

```
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}
```

No caso acima, estamos obtendo o id da instância e o ip da mesma. Após o uso do "**terraform apply**", é possível observar as variáveis printadas no terminal.
Também, é possível obter as variáveis geradas no último apply, com o comando:
```bash
terraform output
```

### Depends on
O depends on é um atributo do Terraform que faz com que um recurso seja criado apenas quando um outro recurso já tenha sido criado. 
Por exemplo:

Se você tiver criando uma VPC via Terraform e uma lambda que necessite dessa VPC, a Lambda precisará que a VPC já esteja criada. Nesse caso, utilizamos o atributo **"depends_on"** no **"resource"** da Lambda.

```terraform
resource "aws_instance" "dev1" {
  ami = "ami-0a8b4cd432b1c3063"
  instance_type = "t2.micro"
  key_name = "tg-dev-useast1-sshtunnel1"
  tags = {
      Name = "teste_ec2_terraform_1"
  }
  vpc_security_group_ids = [aws_security_group.acesso_ssh.id]
  subnet_id = "subnet-00a8bbc3ad94c8c3a"

  depends_on = [
    aws_security_group.acesso_ssh
  ]
}
```

### utilizando multiplos **providers**

É possível subir instâncias em multiplas regiões via Terraform. Por exemplo, caso seja necessário criar um security group em North Viginia e outro em Ohio. É possível criar o seguinte provider abaixo:

```terraform
provider "aws" {
    region  = "us-east-1"
}
provider "aws" {
    alias = "us-east-2"
    region  = "us-east-2"
}
```

O mesmo poderá ser referenciado dessa forma:
```terraform
# Como a padrão é us-east-1, não é necessário adicionar um provider ao resource.
resource "aws_security_group" "acesso_ssh_north_viginia" {
  name        = "acesso_ssh"
  description = "Permite o acesso ao ssh"
  vpc_id      = "vpc-056c3c9fc0591615a"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["189.40.18.26/32"]
  }

  tags = {
    Name = "permite_acesso_ssh"
  }
  
}

# Referenciando (alias) a outra região da AWS:
resource "aws_security_group" "acesso_ssh_ohio" {
  provider    = "aws.us-east-2" # Referência ao provider aws de alias "us-east-2"
  name        = "acesso_ssh"
  description = "Permite o acesso ao ssh"
  vpc_id      = "vpc-056c3c9fc0591615a"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["189.40.18.26/32"]
  }

  tags = {
    Name = "permite_acesso_ssh"
  }
  
}
```
**Desta forma, ao executar via terraform. Será criado dois security groups na AWS, um para a região us-east-1 e outro para a us-east-2.**



