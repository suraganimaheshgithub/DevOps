output "storage_account_name" {
  value = azurerm_storage_account.blob.name
}

output "storage_container_name" {
  value = azurerm_storage_container.blob_container.name
}
