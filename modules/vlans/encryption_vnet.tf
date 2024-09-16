resource "azurerm_resource_group" "create_encryption_resource_group" {
  name     = "encryption_resource_group"
  location = var.location
}

# create virtual network and subnet for encryption
resource "azurerm_virtual_network" "create_encryption_vnet" {
  name                = "encryption_vnet"
  location            = azurerm_resource_group.create_encryption_resource_group.location
  resource_group_name = azurerm_resource_group.create_encryption_resource_group.name
  address_space       = var.address_space_encryption_vnet
  #dns_servers         = var.dns_servers_encryption_vnet

  subnet {
    name             = "main_encryption_subnet"
    address_prefixes = var.address_prefixes_encryption_subnet
  }

  tags = {
    team = "cyber_purple"
  }
}