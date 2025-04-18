variable "name_prefix" {}
variable "env" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "admin_username" {
  default = "azureuser"
}
variable "ssh_public_key_path" {}
variable "vm_size" {
  default = "Standard_B1s"
}
variable "image_publisher" {
  default = "Canonical"
}
variable "image_offer" {
  default = "UbuntuServer"
}
variable "image_sku" {
  default = "22_04-lts-gen2"
}
variable "image_version" {
  default = "latest"
}
variable "tags" {
  type    = map(string)
  default = {}
}
