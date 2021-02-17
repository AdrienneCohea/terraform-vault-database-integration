resource "vault_mount" "database" {
  path                      = var.path
  type                      = "database"
  description               = var.description
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
}

resource "vault_database_secret_backend_connection" "mongodb" {
  backend       = vault_mount.database.path
  name          = var.database_name
  allowed_roles = keys(var.roles)

  mongodb {
    connection_url = var.mongodb_connection_url
  }
}

resource "vault_database_secret_backend_role" "mongodb" {
  for_each = var.roles
  backend  = vault_mount.database.path
  name     = each.key
  db_name  = vault_database_secret_backend_connection.mongodb.name

  creation_statements = [
    jsonencode({
      db    = "admin"
      roles = each.value
    })
  ]
}
