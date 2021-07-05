data "aws_ami" "find" {
  owners = ["self"]
  filter {
    name   = "tag:Name"
    values = ["pcImage"]
  }
}
