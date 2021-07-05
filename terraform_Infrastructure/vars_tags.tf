variable "pub_sub_tags" {
  default = [
    {
      Name = "Public 1"
    },
    {
      Name = "Public 2"
    }
  ]
}

variable "priv_sub_tags" {
  default = [
    {
      Name = "Private 1"
    },
    {
      Name = "Private 2"
    }
  ]
}

variable "bastion_tags" {
  default = {
    Name    = "Bastion "
    Project = "Assessment 3"
  }
}

variable "thelads_sec_tags" {
  default = {
    Name    = "The Lads SecGrp"
    Project = "Assessment 3"
  }
}

variable "theladsDB_sec_tags" {
  default = {
    Name    = "The LadsDB SecGrp"
    Project = "Assessment 3"
  }
}

variable "theladsPC_sec_tags" {
  default = {
    Name    = "The LadsPC SecGrp"
    Project = "Assessment 3"
  }
}

variable "vpc_tags" {
  default = {
    Name    = "The Lads VPC"
    Project = "Assessment 3"
  }
}

variable "igw_tags" {
  default = {
    Name    = "The Lads IGW"
    Project = "Assessment 3"
  }
}

variable "IAM_role_tags" {
  default = {
    Name    = "S3 Bucket IAM Role"
    Project = "Assessment 3"
  }
}
