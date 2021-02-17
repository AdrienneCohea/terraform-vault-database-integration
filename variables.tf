variable "address" {
  type        = string
  description = "Vault address"
}

variable "token" {
  type        = string
  description = "Vault token"
}

variable "mongodb_connection_url" {
  type        = string
  description = "MongoDB connection URL"
}

variable "path" {
  type        = string
  description = "Path to create the database secrets engine for the integration"
}

variable "database_name" {
  type        = string
  description = "Logical name of the database"
}

variable "description" {
  default     = ""
  type        = string
  description = "Description of the database secrets engine in Vault"
}

variable "roles" {
  type        = map(list(object({ db = string, role = string })))
  description = "Database access roles as they should be defined in Vault, given as a map from strings to objects having database names and role names in MongoDB."
}

variable "max_lease_ttl_seconds" {
  default     = 24 * 60 * 60
  description = "The maximum lease duration in seconds"
}

variable "default_lease_ttl_seconds" {
  default     = 6 * 60 * 60
  description = "The default lease duration in seconds"
}
