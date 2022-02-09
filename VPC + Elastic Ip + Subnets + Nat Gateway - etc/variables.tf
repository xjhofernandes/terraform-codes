# Configuração da subnet privada
variable "subn_prv" {
  type = list(object({
    name       = string
    cidr_block = string
  }))
  default = [
    {
      name       = "tg-dev-subn-prv-terraform-0-a"
      cidr_block = "10.0.3.0/24"
    },
    {
      name       = "tg-dev-subn-prv-terraform-0-b"
      cidr_block = "10.0.4.0/24"
    },
    {
      name       = "tg-dev-subn-prv-terraform-0-c"
      cidr_block = "10.0.5.0/24"
    },
  ]
}

# Configuração da subnet publica
variable "subn_pub" {
  type = list(object({
    name       = string
    cidr_block = string
  }))
  default = [
    {
      name       = "tg-dev-subn-pub-terraform-0-a"
      cidr_block = "10.0.0.0/24"
    },
    {
      name       = "tg-dev-subn-pub-terraform-0-b"
      cidr_block = "10.0.1.0/24"
    },
    {
      name       = "tg-dev-subn-pub-terraform-0-c"
      cidr_block = "10.0.2.0/24"
    },
  ]
}

# Configuração da subnet natg
variable "subn_natg" {
  type = list(object({
    name       = string
    cidr_block = string
  }))
  default = [
    {
      name       = "tg-dev-subn-natg-terraform-0-a"
      cidr_block = "10.0.6.0/24"
    },
    {
      name       = "tg-dev-subn-natg-terraform-0-b"
      cidr_block = "10.0.7.0/24"
    },
    {
      name       = "tg-dev-subn-natg-terraform-0-c"
      cidr_block = "10.0.8.0/24"
    },
  ]
}
