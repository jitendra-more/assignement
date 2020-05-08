variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "dev26"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "dev26.pub"
}


variable "AMIS" {
  type = map(string)
  default = {
    ap-south-1 = "ami-052c08d70def0ac62"
  }
}
