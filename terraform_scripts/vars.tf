variable "ACCESS_KEY" {
}

variable "SECRET_KEY" {
}

variable "AWS_REGION" {
}

variable "LINUX_USER" {
}

variable "LINUX_PASSWORD" {
}

variable "AMIS" {
  type = map(string)
  default = {
    eu-west-1 = "ami-0fc970315c2d38f01"
  }
}