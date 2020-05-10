variable "deploy" {
  type = bool
  default = true
}

variable "region" {}

variable "name" {}

variable "description" {}

variable "network" {}

variable "egress" {
  default = []
}
