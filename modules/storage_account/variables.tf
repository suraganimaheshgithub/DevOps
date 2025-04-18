variable "name_prefix" {}
variable "env" {}
variable "location" {}
variable "resource_group_name" {}
variable "container_name" {
  default = "default-container"
}
variable "container_access_type" {
  default = "private"
}
variable "account_tier" {
  default = "Standard"
}
variable "replication_type" {
  default = "LRS"
}
variable "tags" {
  type    = map(string)
  default = {}
}
