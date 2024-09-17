resource "azurerm_resource_group" "create_vpn_resource_group" {
  name     = "vpn-resource-group"
  location = var.location
  tags = {
    owned_by = "Hashlama015"
  }
}

# create virtual network and subnet for vpn
resource "azurerm_virtual_network" "create_vpn_vnet" {
  name                = "vpn-vnet"
  location            = azurerm_resource_group.create_vpn_resource_group.location
  resource_group_name = azurerm_resource_group.create_vpn_resource_group.name
  address_space       = var.address_space_vpn_vnet
  #dns_servers         = vars.dns_servers_vpn_vnet

  # subnet {
  #   name             = "main-vpn-subnet"
  #   address_prefix = var.address_prefixes_vpn_subnet
  # }


  tags = {
    owned_by = "Hashlama015"
    team     = "cyber_purple"
  }
}

resource "azurerm_subnet" "create_vpn_subnet" {
  name                 = "main-vpn-subnet"
  resource_group_name  = azurerm_resource_group.create_vpn_resource_group.name
  virtual_network_name = azurerm_virtual_network.create_vpn_vnet.name
  address_prefixes     = var.address_prefixes_vpn_subnet # azurerm_subnet expects "address_prefixes" instead of "address_prefix"
}
