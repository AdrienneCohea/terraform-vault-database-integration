module "mongo" {
  count  = var.mongodb_connection_url != "" ? 1 : 0
  source = "./mongodb"

  backend                = vault_mount.database.path
  mongodb_connection_url = var.mongodb_connection_url
  mongodb_roles          = var.mongodb_roles
  database_name          = var.database_name

  depends_on = [vault_mount.database]
}
