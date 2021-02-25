variable "address" {
  type        = string
  description = "Vault address"
}

variable "token" {
  type        = string
  description = "Vault token"
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

variable "max_lease_ttl_seconds" {
  default     = 24 * 60 * 60
  description = "The maximum lease duration in seconds"
}

variable "default_lease_ttl_seconds" {
  default     = 6 * 60 * 60
  description = "The default lease duration in seconds"
}

variable "mongodb_connection_url" {
  type        = string
  description = "MongoDB connection URL"
  default     = ""
}

variable "mongodb_roles" {
  type        = map(list(object({ db = string, role = string })))
  description = "Database access roles as they should be defined in Vault, given as a map from strings to objects having database names and role names in MongoDB."
  default     = null
}

variable "postgresql_connection_url" {
  type        = string
  description = "PostgreSQL connection URL"
  default     = ""
}

variable "postgresql_roles" {
  type        = map(object({ grants = list(string), schema = string }))
  description = "Database access roles as they should be defined in Vault, given as a map from strings to objects having database names and role names in PostgreSQL."
  default     = null
}
