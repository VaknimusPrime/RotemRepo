variable "host" {
  type          = string
  description   = "the database's host"
  default       = "10.100.102.7"
}

variable "user" {
  type          = string
  description   = "root username"
  default       = "root"
}

variable "pass" {
  type          = string
  description   = "root password"
  default       = "RootPass"
}

variable "db" {
  type          = string
  description   = "database"
  default       = "mysql"
}

locals {
  connection_values = {
    host  = var.host
    user  = var.user
    pass  = var.pass
    db    = var.db
  }
}

output "connection_values" {
  value = local.connection_values
}