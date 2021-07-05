variable "lads_asw_pg" {
  type    = string
  default = "lads_asw_pg"
}

variable "lads_asg" {
  default = "ads_asg"
  type    = string
}

variable "TheLadslb" {
  type    = string
  default = "TheLadslb"
}

variable "TheLadslb_copy" {
  type    = list(string)
  default = ["TheLadslb1", "TheLadslb2"]
}

variable "jenkins_role" {
  type    = string
  default = "jenkins_lads"
}

variable "bastion_role" {
  type    = string
  default = "bastion_lads"
}

variable "theladsbucket" {
  type    = string
  default = "theladsbucket"
}

variable "our_ip_secgrp" {
  type    = string
  default = "TheLads"
}

variable "db_secgrp" {
  type    = string
  default = "TheLadsDB"
}

variable "pc_secgrp" {
  type    = string
  default = "TheLadsPC"
}

variable "asg_sched" {
  type    = string
  default = "asg_sched"
}

variable "lads_asg_policy" {
  type    = string
  default = "lads_asg_policy"
}
