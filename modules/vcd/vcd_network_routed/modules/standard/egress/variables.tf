variable "deploy" {
  type = bool
  default = true
}

variable "region" {}

variable "name" {}

variable "description" {}

variable "network" {}

variable "egress" {
  type = list(object({
    to = string
    ports = list(string)
    with_addr = string
  }))
  
  default = []
}
