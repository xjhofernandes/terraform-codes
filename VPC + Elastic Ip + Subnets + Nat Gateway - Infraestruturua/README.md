## :construction: Pasta contendo as principais configurações da infraestrutura de VPC, Elastic IP, Subnets e Nat Gateway.

### Script responsável por criar:
* VPC
* Elastic IP
* Subnets Public, Private e NatG (Nat Gateway)
    * Cada subnet contendo 3 Availabity Zone (A, B e C)
* Internet Gateway
* Nat Gateway (natg)
* Route Table para cada subnet.
    * No caso da subnet natg, é criado uma route para o NAT Gateway. Tendo um Ip Elastic associado. 


### Como rodar

**Ao acessar a pasta, útilize os seguinte comando para baixar os pré requisitos do Terraform**
```bash
terraform init
```

**Depois útilize o comando plan para verificar as mudanças que serão feitas.**
```bash	
terraform plan
```

**Caso as mudanças estejam de acordo, utilize o comando apply para criar as configurações no seu ambiente nuvem.**
```bash
terraform apply
```

**Caso deseje reverter as mudanças, utilize o comando destroy.**
```bash
terraform destroy
```