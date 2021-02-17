output "credentials_endpoints" {
  value = { for key, role in vault_database_secret_backend_role.mongodb : key => "${vault_mount.database.path}/creds/${role.name}" }
}
