variable "name" {}

variable "description" {}

variable "network" {
  description="0.0.0.0/0"
}

variable "region" {}

variable "ingress" {
  default = []
}

variable "egress" {
  type = list(object({
    to = string
    ports = list(string)
    with_addr = string
  }))
  
  default = []
}
