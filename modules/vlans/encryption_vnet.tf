resource "azurerm_resource_group" "create_encryption_resource_group" {
  name     = "encryption_resource_group"
  location = vars.location
}

# create virtual network and subnet for encryption
resource "azurerm_virtual_network" "create_encryption_vnet" {
  name                = "encryption_vnet"
  location            = azurerm_resource_group.create_encryption_resource_group.location
  resource_group_name = azurerm_resource_group.create_encryption_resource_group.name
  address_space       = vars.address_space_encryption_vnet
  #dns_servers         = vars.dns_servers_encryption_vnet

  subnet {
    name             = "main_encryption_subnet"
    address_prefixes = vars.address_prefixes_encryption_subnet
  }

  tags = {
    team = "cyber_purple"
  }
}

output "encryption_vnet_name" {
  value = azurerm_virtual_network.create_encryption_vnet.name 
}
output "encryption_subnet_name" {
  value = azurerm_subnet.create_encryption_vnet.subnet[0].name 
}
output "encryption_resource_group_name" {
  value = azurerm_resource_group.create_encryption_resource_group.name 
}
output "encryption_vnet_ip" {
  value = azurerm_virtual_network.create_encryption_vnet.subnet[0].address_prefixes[0]
}