resource "vault_database_secret_backend_connection" "mongodb" {
  backend       = var.backend
  name          = var.database_name
  allowed_roles = keys(var.mongodb_roles)

  mongodb {
    connection_url = var.mongodb_connection_url
  }
}

resource "vault_database_secret_backend_role" "mongodb" {
  for_each = var.mongodb_roles
  backend  = var.backend
  name     = each.key
  db_name  = vault_database_secret_backend_connection.mongodb.name

  creation_statements = [
    jsonencode({
      db    = "admin"
      roles = each.value
    })
  ]

  depends_on = [vault_database_secret_backend_connection.mongodb]
}
