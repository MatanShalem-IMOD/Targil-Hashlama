resource "azurerm_resource_group" "create_hub_resource_group" {
  name     = "hub_resource_group"
  location = vars.location
}

# create virtual network and subnet for hub
resource "azurerm_virtual_network" "create_hub_vnet" {
  name                = "hub_vnet"
  location            = azurerm_resource_group.create_hub_resource_group.location
  resource_group_name = azurerm_resource_group.create_hub_resource_group.name
  address_space       = vars.address_space_hub_vnet
  dns_servers         = vars.dns_servers_hub_vnet

  subnet {
    name             = "cyber_vms_hub_subnet"
    address_prefixes = vars.address_prefixes_hub_subnet
  }

  subnet {
    name             = "firewall_hub_subnet"
    address_prefixes = vars.address_prefixes_firewall_hub_subnet
  }

  tags = {
    team = "cyber_purple"
  }
}
