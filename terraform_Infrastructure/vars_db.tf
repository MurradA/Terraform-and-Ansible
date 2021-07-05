variable "snapshotid" {
  description = "snapshot id to restore"
  type        = string
  default     = null
}

variable "dbuser" {
  type    = string
  default = "Lads"
}

variable "dbpassword" {
  type    = string
  default = "secret123"
}

variable "dbsize" {
  type    = string
  default = "db.t2.micro"
}

variable "engine" {
  type    = string
  default = "mariadb"
}

variable "engine_version" {
  type    = string
  default = "10.2.21"
}

variable "storage" {
  type    = number
  default = 5
}

variable "dbname" {
  type    = string
  default = "theladsdb"
}

variable "monrole" {
  type    = string
  default = "theladsdbmonitoringrole"
}

variable "monint" {
  type    = string
  default = 30
}

variable "monitoring_role_arn" {
  type    = string
  default = null
}

variable "monitor_role" {
  type    = bool
  default = true
}

variable "user_tags" {
  default = {
    Name        = "theladsdb"
    Owner       = "lads"
    Project     = "ALAcademy"
    Environment = "dev"
  }
}

variable "maj_eng_ver" {
  type    = string
  default = 10.2
}

variable "multi_az" {
  type    = bool
  default = true
}

variable "protect" {
  type    = bool
  default = false
}
