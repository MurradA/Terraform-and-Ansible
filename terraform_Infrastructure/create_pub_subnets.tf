resource "aws_subnet" "public" {
  count = length(var.subnet_cidrs_public)

  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidrs_public[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags                    = var.pub_sub_tags[count.index]
}
