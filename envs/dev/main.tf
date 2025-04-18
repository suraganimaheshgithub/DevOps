provider "azurerm" {
  features {}

  client_id       = "bc5d63dc-92e7-46ec-8396-edf9d180e675"
  client_secret   = "J648Q~pbxC6ZUmXY1Au8RqepoQ2iQ6kCpeBGZcnH"
  tenant_id       = "71930c19-7b15-40ef-9005-903b906c124b"
  subscription_id = "7807efb0-5c21-43e3-9f3f-105501f6c022"
}

resource "azurerm_resource_group" "dev_rg" {
  name     = "${var.name_prefix}-rg-${var.env}"
  location = var.location
}

module "vnet" {
  source              = "../../modules/vnet"
  name_prefix         = var.name_prefix
  env                 = var.env
  location            = var.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  address_space       = var.vnet_address_space
  subnet_prefixes     = var.subnet_address_space
  tags                = var.default_tags
}

module "vm" {
  source              = "../../modules/virtual_machine"
  name_prefix         = var.name_prefix
  env                 = var.env
  location            = var.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  subnet_id           = module.vnet.subnet_id
  admin_username      = "azureuser"
  ssh_public_key_path = "${path.module}/id_rsa.pub"
  tags                = var.default_tags
}

#ssh_public_key_path:id_rsa.pub ssh-keygen -t rsa -b 4096 -f id_rsa -C azureuser

module "storage" {
  source              = "../../modules/storage_account"
  name_prefix         = var.name_prefix
  env                 = var.env
  location            = var.location
  resource_group_name = azurerm_resource_group.dev_rg.name
  container_name      = "appblobs"
  container_access_type = "private"
  account_tier        = "Standard"
  replication_type    = "LRS"
  tags                = var.default_tags
}


