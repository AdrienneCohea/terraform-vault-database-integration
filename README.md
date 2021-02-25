# Vault Database Integration

Vault integration module for various databases

For example, MongoDB:

```
module "database-integration" {
  source  = "AdrienneCohea/database-integration/vault"
  version = "0.0.4"

  address       = "http://127.0.0.1:8200"
  token         = "myroot"
  path          = "mongodb"
  database_name = "mongodb"
  description   = "MongoDB"

  mongodb_connection_url = "mongodb://root:example@172.23.0.3:27017"

  roles = {
    "engagements" = [{ role = "readWrite", db = "engagements" }]
  }
}
```

For PostgreSQL:

```
module "integration" {
  source  = "AdrienneCohea/database-integration/vault"
  version = "0.0.4"

  address       = "http://127.0.0.1:8200"
  token         = "myroot"
  path          = "postgresql"
  database_name = "postgresql"
  description   = "PostgreSQL"

  postgresql_connection_url = "postgresql://vault-superuser:example@172.26.0.2:5432/?sslmode=disable"
  postgresql_roles = {
    "engagements" = {
      grants = ["SELECT", "INSERT", "UPDATE", "DELETE"],
      tables = ["organizations", "auditors"]
    }
  }
}
```
