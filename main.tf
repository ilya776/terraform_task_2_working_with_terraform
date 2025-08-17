resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "examplestorageacc"     # має бути унікальним по всьому Azure!
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.example.name   # ← додано
  container_access_type = "private"
}

data "archive_file" "tf_code" {
  type        = "zip"
  source_dir  = path.module
  output_path = "${path.module}/build/tfcode.zip"

  excludes = [
    ".terraform",
    ".git",
    "build",
    "terraform.tfvars",
    "tfplan"
  ]
}

resource "azurerm_storage_blob" "tf_zip" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.example.name   # ← додано
  storage_container_name = azurerm_storage_container.container.name
  type                   = "Block"
  source                 = data.archive_file.tf_code.output_path
  content_type           = "application/zip"
}
