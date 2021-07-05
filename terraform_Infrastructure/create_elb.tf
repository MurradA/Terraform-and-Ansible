resource "aws_elb" "lb" {
  name            = var.TheLadslb
  security_groups = [aws_security_group.theladsDB.id]
  subnets         = [aws_subnet.public[0].id, aws_subnet.public[1].id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}
