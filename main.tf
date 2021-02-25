resource "vault_mount" "database" {
  path                      = var.path
  type                      = "database"
  description               = var.description
  default_lease_ttl_seconds = var.default_lease_ttl_seconds
  max_lease_ttl_seconds     = var.max_lease_ttl_seconds
}
