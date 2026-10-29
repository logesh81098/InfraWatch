variable "ami-id" {
  default = "ami-03765515c80e0c765"
}

variable "instance-type" {
  default = "t3.medium"
}

variable "infrawatch-public-subnet-id" {
  default = {}
}

variable "infrawatch-sg" {
  default = {}
}

variable "infrawatch-keypair" {
  default = {}
}

variable "infrawatch-instance-profile" {
  default = {}
}