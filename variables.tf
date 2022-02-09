variable "subn-prv" {
  type = list(object({
    name = string
    aws_subnet = string
  }))
  default = [
    {
      name = "tg-dev-subn-prv-0-a"
      aws_subnet = "10.0.3.0/24"
    },
    {
      name = "tg-dev-subn-prv-0-b"
      aws_subnet = "10.0.4.0/24"
    },
    {
      name = "tg-dev-subn-prv-0-c"
      aws_subnet = "10.0.5.0/24"
    },
  ]
}
