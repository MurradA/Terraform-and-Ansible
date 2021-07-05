variable "aws_profile" {
  type    = string
  default = "academy2"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ec2_image" {
  type    = string
  default = "ami-09d95fab7fff3776c"
}

variable "ec2_type" {
  type    = string
  default = "t2.micro"
}

variable "sshkey" {
  type    = string
  default = "davidT"
}

variable "subnet_cidrs_public" {
  type    = list(string)
  default = ["172.30.1.0/24", "172.30.10.0/24"]
}

variable "subnet_cidrs_private" {
  type    = list(string)
  default = ["172.30.2.0/24", "172.30.20.0/24"]
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
  type    = list(string)
}

variable "our_ips" {
  default = ["86.47.40.12/32", "86.23.63.142/32", "81.157.193.241/32"] # David, Tom, Murrad
  type    = list(string)
}

variable "jenkins_iam_policy_arns" {
  default = ["arn:aws:iam::aws:policy/AmazonS3FullAccess", "arn:aws:iam::aws:policy/AmazonEC2FullAccess", "arn:aws:iam::aws:policy/AmazonRDSFullAccess", "arn:aws:iam::aws:policy/IAMFullAccess"]
  type    = list(string)
}

variable "bastion_iam_policy_arn" {
  default = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  type    = string
}
