# resource "aws_subnet" "private" {
#   count = length(var.subnet_cidrs_private)
#
#   vpc_id            = aws_vpc.main.id
#   cidr_block        = var.subnet_cidrs_private[count.index]
#   availability_zone = var.availability_zones[count.index]
#   tags = merge(
#     var.priv_sub_tags,
#     map(
#       "Name", join("", [var.priv_sub_tags.Name, count.index])
#     )
#   )
# }

resource "aws_subnet" "private" {
  count = length(var.subnet_cidrs_private)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidrs_private[count.index]
  availability_zone = var.availability_zones[count.index]
  tags              = var.priv_sub_tags[count.index]
}
