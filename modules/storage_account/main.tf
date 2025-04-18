resource "azurerm_storage_account" "blob" {
  name                     = lower(substr("${var.name_prefix}sa${var.env}", 0, 24))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  access_tier              = "Hot"
  tags                     = var.tags
}

resource "azurerm_storage_container" "blob_container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.blob.id
  container_access_type = var.container_access_type
}

