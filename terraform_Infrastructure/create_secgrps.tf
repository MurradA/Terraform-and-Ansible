resource "aws_security_group" "thelads" {
  name   = var.our_ip_secgrp
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.our_ips
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.thelads_sec_tags
}

resource "aws_security_group" "theladsDB" {
  name   = var.db_secgrp
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.30.0.0/16"]
  }
  tags = var.theladsDB_sec_tags
}

resource "aws_security_group" "theladsPC" {
  name   = var.pc_secgrp
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.theladsPC_sec_tags
}
