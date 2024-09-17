
# Need to pull encryption Resource Group from live environment
data "azurerm_resource_group" "existing_vpn_rg" {
  name     = var.vpn_resource_group_name
}


# create virtual network and subnet for vpn
resource "azurerm_virtual_network" "create_vpn_vnet" {
  name                = "vpn-vnet"
  location            = data.azurerm_resource_group.existing_vpn_rg.location
  resource_group_name = data.azurerm_resource_group.existing_vpn_rg.name
  address_space       = var.address_space_vpn_vnet
  #dns_servers         = vars.dns_servers_vpn_vnet

  # subnet {
  #   name             = "main-vpn-subnet"
  #   address_prefix = var.address_prefixes_vpn_subnet
  # }


  tags = {
    owned_by = "Hashlama015"
  }
}

resource "azurerm_subnet" "create_vpn_subnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = data.azurerm_resource_group.existing_vpn_rg.name
  virtual_network_name = azurerm_virtual_network.create_vpn_vnet.name
  address_prefixes     = var.address_prefixes_GatewaySubnet # azurerm_subnet expects "address_prefixes" instead of "address_prefix"
}
