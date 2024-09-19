<<<<<<< HEAD
resource "azurerm_resource_group" "create_firewall_resource_group" {
  name     = "firewall-resource-group"
  location = var.location
}

# create virtual network and subnet for firewall
resource "azurerm_virtual_network" "create_firewall_vnet" {
  name                = "firewall-vnet"
  location            = azurerm_resource_group.create_firewall_resource_group.location
  resource_group_name = azurerm_resource_group.create_firewall_resource_group.name
=======

# Need to pull encryption Resource Group from live environment
data "azurerm_resource_group" "existing_firewall_rg" {
  name     = var.firewall_resource_group_name
}


# create virtual network and subnet for firewall
resource "azurerm_virtual_network" "create_firewall_vnet" {
  name                = "firewall-vnet"
  location            = data.azurerm_resource_group.existing_firewall_rg.location
  resource_group_name = data.azurerm_resource_group.existing_firewall_rg.name
>>>>>>> Dev-no-rgs
  address_space       = var.address_space_firewall_vnet
  #dns_servers         = vars.dns_servers_firewall_vnet

  # subnet {
  #   name             = "main-firewall-subnet"
  #   address_prefix = var.address_prefixes_firewall_subnet
  # }


  tags = {
<<<<<<< HEAD
    team = "cyber_purple"
=======
    owned_by = "Hashlama015"
>>>>>>> Dev-no-rgs
  }
}

resource "azurerm_subnet" "create_firewall_subnet" {
<<<<<<< HEAD
  name                 = "main-firewall-subnet"
  resource_group_name  = azurerm_resource_group.create_firewall_resource_group.name
=======
  name                 = "AzureFirewallSubnet"
  resource_group_name  = data.azurerm_resource_group.existing_firewall_rg.name
>>>>>>> Dev-no-rgs
  virtual_network_name = azurerm_virtual_network.create_firewall_vnet.name
  address_prefixes     = var.address_prefixes_firewall_subnet # azurerm_subnet expects "address_prefixes" instead of "address_prefix"
}
