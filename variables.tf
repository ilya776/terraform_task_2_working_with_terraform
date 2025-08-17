# variables.tf
variable "resource_group_name" {
  type        = string
  description = "Resource Group з вашим Storage Account"
}

variable "location" {
  type        = string
  description = "Azure регіон"
}

variable "storage_account_name" {
  type        = string
  description = "Ім'я існуючого або створюваного Storage Account"
}

variable "container_name" {
  type        = string
  description = "Ім'я контейнера blob"
}

variable "blob_name" {
  type        = string
  description = "Ім'я блоба"
}
