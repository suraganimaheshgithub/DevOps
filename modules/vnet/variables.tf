# modules/vnet/variables.tf

variable "name_prefix" {
  description = "Prefix for naming Azure resources"
  type        = string
}
variable "env" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "address_space" {
  type = list(string)
}
variable "subnet_prefixes" {
  type = list(string)
}
variable "tags" {
  type    = map(string)
  default = {}
}
