resource "aws_instance" "bastion" {
  count = length(var.subnet_cidrs_public)

  ami                    = var.ec2_image
  instance_type          = var.ec2_type
  key_name               = var.sshkey
  subnet_id              = element(aws_subnet.public.*.id, count.index)
  vpc_security_group_ids = [aws_security_group.thelads.id]
  tags                   = var.bastion_tags
  availability_zone      = var.availability_zones[count.index]
  user_data              = file("bastion_prov.sh")

}
