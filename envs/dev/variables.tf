variable "name_prefix" {
  description = "Prefix for naming Azure resources"
  type        = string
}
variable "env" {
  description = "Environment name (e.g., dev, test, prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}
variable "vnet_address_space" {
  type = list(string)
}
variable "subnet_address_space" {
  type = list(string)
}

variable "default_tags" {
  type = map(string)
}
