resource "azurerm_resource_group" "create_firewall_resource_group" {
  name     = "firewall_resource_group"
  location = vars.location
}

# create virtual network and subnet for firewall
resource "azurerm_virtual_network" "create_firewall_vnet" {
  name                = "firewall_vnet"
  location            = azurerm_resource_group.create_firewall_resource_group.location
  resource_group_name = azurerm_resource_group.create_firewall_resource_group.name
  address_space       = vars.address_space_firewall_vnet
  dns_servers         = vars.dns_servers_firewall_vnet

  subnet {
    name             = "main_firewall_subnet"
    address_prefixes = vars.address_prefixes_firewall_subnet
  }


  tags = {
    team = "cyber_purple"
  }
}
