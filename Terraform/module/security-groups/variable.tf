variable "vpc-id" {
  default = {}
}

variable "ssh-port" {
  default = "22"
}

variable "my-ip" {
  default = "49.37.206.70/32"
}

variable "anywhere-ip" {
  default = "0.0.0.0/0"
}

variable "prometheus-port" {
  default = "9090"
}