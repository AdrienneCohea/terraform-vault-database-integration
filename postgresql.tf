module "psql" {
  count  = var.postgresql_connection_url != "" ? 1 : 0
  source = "./postgresql"

  backend                   = vault_mount.database.path
  postgresql_connection_url = var.postgresql_connection_url
  postgresql_roles          = var.postgresql_roles
  database_name             = var.database_name

  depends_on = [vault_mount.database]
}
