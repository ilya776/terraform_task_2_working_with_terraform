output "blob_id" {
  value       = azurerm_storage_blob.tf_zip.id
  description = "Повний ID блоба"
}

output "blob_url" {
  value       = azurerm_storage_blob.tf_zip.url
  description = "URL блоба"
}
