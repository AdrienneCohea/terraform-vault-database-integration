variable "address" {}
variable "token" {}
variable "mongodb_connection_url" {}
variable "path" {}
variable "database_name" {}
variable "description" {
  default = ""
}

variable "roles" {
  type = map(list(object({ db = string, role = string })))
}

variable "max_lease_ttl_seconds" {
  default = 24 * 60 * 60
}

variable "default_lease_ttl_seconds" {
  default = 6 * 60 * 60
}
