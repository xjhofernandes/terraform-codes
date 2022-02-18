variable "ambiente" {
  description = "Ambiente que ocorrerá a aplicação. Dev ou Prod"
  type        = string
  default     = "dev"
}

variable "tipo_vpc" {
  description = "Tipo de VPC que será criado. pub, prv ou natg"
  default     = "natg"
}

variable "lambda_memory_size" {
  description = "Memória ram disponível na Lambda"
  type    = number
  default = 128
}

variable "lambda_timeout" {
  description = "Tempo limite da Lambda"
  type    = number
  default = 300
}
