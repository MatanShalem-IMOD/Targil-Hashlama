<<<<<<< HEAD
resource "azurerm_resource_group" "create_hub_resource_group" {
  name     = "hub-resource-group"
  location = var.location
}

# create virtual network and subnet for hub
resource "azurerm_virtual_network" "create_hub_vnet" {
  name                = "hub-vnet"
  location            = azurerm_resource_group.create_hub_resource_group.location
  resource_group_name = azurerm_resource_group.create_hub_resource_group.name
=======

# Need to pull encryption Resource Group from live environment
data "azurerm_resource_group" "existing_hub_rg" {
  name     = var.hub_resource_group_name
}


# create virtual network and subnet for hub
resource "azurerm_virtual_network" "create_hub_vnet" {
  name                = "hub-vnet"
  location            = data.azurerm_resource_group.existing_hub_rg.location
  resource_group_name = data.azurerm_resource_group.existing_hub_rg.name
>>>>>>> Dev-no-rgs
  address_space       = var.address_space_hub_vnet
  #dns_servers         = var.dns_servers_hub_vnet

  # subnet {
  #   name             = "main-hub-subnet"
  #   address_prefix = var.address_prefixes_main_hub_subnet
  # }


  tags = {
<<<<<<< HEAD
    team = "cyber_purple"
=======
    owned_by = "Hashlama015"
>>>>>>> Dev-no-rgs
  }
}

resource "azurerm_subnet" "create_hub_subnet" {
  name                 = "main-hub-subnet"
<<<<<<< HEAD
  resource_group_name  = azurerm_resource_group.create_hub_resource_group.name
  virtual_network_name = azurerm_virtual_network.create_hub_vnet.name
  address_prefixes     = var.address_prefixes_main_hub_subnet # azurerm_subnet expects "address_prefixes" instead of "address_prefix"
}
=======
  resource_group_name  = data.azurerm_resource_group.existing_hub_rg.name
  virtual_network_name = azurerm_virtual_network.create_hub_vnet.name
  address_prefixes     = var.address_prefixes_main_hub_subnet # azurerm_subnet expects "address_prefixes" instead of "address_prefix"
}
>>>>>>> Dev-no-rgs
