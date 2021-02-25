resource "vault_database_secret_backend_connection" "postgresql" {
  backend       = var.backend
  name          = var.database_name
  allowed_roles = keys(var.postgresql_roles)

  postgresql {
    connection_url = var.postgresql_connection_url
  }
}

resource "vault_database_secret_backend_role" "postgresql" {
  for_each = var.postgresql_roles
  backend  = var.backend
  name     = each.key
  db_name  = vault_database_secret_backend_connection.postgresql.name

  creation_statements = []

  depends_on = [vault_database_secret_backend_connection.postgresql]
}
