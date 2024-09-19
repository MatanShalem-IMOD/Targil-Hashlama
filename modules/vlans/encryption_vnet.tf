<<<<<<< HEAD
resource "azurerm_resource_group" "create_encryption_resource_group" {
  name     = "encryption_resource_group"
  location = var.location
=======

# Need to pull encryption Resource Group from live environment
data "azurerm_resource_group" "existing_encryption_rg" {
  name     = var.encryption_resource_group_name
>>>>>>> Dev-no-rgs
}

# create virtual network and subnet for encryption
resource "azurerm_virtual_network" "create_encryption_vnet" {
  name                = "encryption_vnet"
<<<<<<< HEAD
  location            = azurerm_resource_group.create_encryption_resource_group.location
  resource_group_name = azurerm_resource_group.create_encryption_resource_group.name
=======
  location            = data.azurerm_resource_group.existing_encryption_rg.location
  resource_group_name = data.azurerm_resource_group.existing_encryption_rg.name
>>>>>>> Dev-no-rgs
  address_space       = var.address_space_encryption_vnet
  #dns_servers         = vars.dns_servers_encryption_vnet

  # subnet {
  #   name             = "main_encryption_subnet"
  #   address_prefix = var.address_prefixes_encryption_subnet
  # }

  tags = {
<<<<<<< HEAD
    team = "cyber_purple"
=======
    owned_by = "Hashlama015"
>>>>>>> Dev-no-rgs
  }
}

resource "azurerm_subnet" "create_encryption_subnet" {
  name                 = "main_encryption_subnet"
<<<<<<< HEAD
  resource_group_name  = azurerm_resource_group.create_encryption_resource_group.name
=======
  resource_group_name  = data.azurerm_resource_group.existing_encryption_rg.name
>>>>>>> Dev-no-rgs
  virtual_network_name = azurerm_virtual_network.create_encryption_vnet.name
  address_prefixes     = var.address_prefixes_encryption_subnet # azurerm_subnet expects "address_prefixes" instead of "address_prefix"
}