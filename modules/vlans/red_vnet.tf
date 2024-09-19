
# Need to pull red Resource Group from live environment
data "azurerm_resource_group" "existing_red_rg" {
  name     = var.red_resource_group_name
}

# create virtual network and subnet for red
resource "azurerm_virtual_network" "create_red_vnet" {
  name                = "red_vnet"
  location            = data.azurerm_resource_group.existing_red_rg.location
  resource_group_name = data.azurerm_resource_group.existing_red_rg.name
  address_space       = var.address_space_red_vnet
  #dns_servers         = vars.dns_servers_red_vnet

  # subnet {
  #   name             = "main_red_subnet"
  #   address_prefix = var.address_prefixes_red_subnet
  # }

  tags = {
    owned_by = "Hashlama015"
  }
}

resource "azurerm_subnet" "create_red_subnet" {
  name                 = "main_red_subnet"
  resource_group_name  = data.azurerm_resource_group.existing_red_rg.name
  virtual_network_name = azurerm_virtual_network.create_red_vnet.name
  address_prefixes     = var.address_prefixes_red_subnet # azurerm_subnet expects "address_prefixes" instead of "address_prefix"
}