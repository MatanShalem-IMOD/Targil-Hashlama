
# Need to pull encryption Resource Group from live environment
data "azurerm_resource_group" "existing_hub_rg" {
  name     = var.hub_resource_group_name
}


# create virtual network and subnet for hub
resource "azurerm_virtual_network" "create_hub_vnet" {
  name                = "hub-vnet"
  location            = data.azurerm_resource_group.existing_hub_rg.location
  resource_group_name = data.azurerm_resource_group.existing_hub_rg.name
  address_space       = var.address_space_hub_vnet
  #dns_servers         = var.dns_servers_hub_vnet

  # subnet {
  #   name             = "main-hub-subnet"
  #   address_prefix = var.address_prefixes_main_hub_subnet
  # }


  tags = {
    owned_by = "Hashlama015"
  }
}

resource "azurerm_subnet" "create_hub_subnet" {
  name                 = "main-hub-subnet"
  resource_group_name  = data.azurerm_resource_group.existing_hub_rg.name
  virtual_network_name = azurerm_virtual_network.create_hub_vnet.name
  address_prefixes     = var.address_prefixes_main_hub_subnet # azurerm_subnet expects "address_prefixes" instead of "address_prefix"
}
