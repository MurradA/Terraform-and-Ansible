resource "aws_nat_gateway" "ngw" {
  count         = 1
  allocation_id = aws_eip.nat.id
  subnet_id     = element(aws_subnet.public.*.id, count.index)
}
