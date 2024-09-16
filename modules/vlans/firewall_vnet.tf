resource "azurerm_resource_group" "create_firewall_resource_group" {
  name     = "firewall-resource-group"
  location = var.location
}

# create virtual network and subnet for firewall
resource "azurerm_virtual_network" "create_firewall_vnet" {
  name                = "firewall-vnet"
  location            = azurerm_resource_group.create_firewall_resource_group.location
  resource_group_name = azurerm_resource_group.create_firewall_resource_group.name
  address_space       = var.address_space_firewall_vnet
  #dns_servers         = vars.dns_servers_firewall_vnet

  subnet {
    name             = "main-firewall-subnet"
    address_prefixes = var.address_prefixes_firewall_subnet
  }


  tags = {
    team = "cyber_purple"
  }
}
