resource "azurerm_resource_group" "create_cluster_resource_group" {
  name     = "cluster_resource_group"
  location = var.location
}

# create virtual network and subnet for cluster
resource "azurerm_virtual_network" "create_cluster_vnet" {
  name                = "cluster_vnet"
  location            = azurerm_resource_group.create_cluster_resource_group.location
  resource_group_name = azurerm_resource_group.create_cluster_resource_group.name
  address_space       = var.address_space_cluster_vnet
  #dns_servers         = var.dns_servers_cluster_vnet
  tags = {
    team = "tashtiot"
  }
}


resource "azurerm_subnet" "create_openshift_cluster_subnet" {
  name                 = "openshift_cluster_subnet"
  resource_group_name  = azurerm_resource_group.create_cluster_resource_group.name
  virtual_network_name = azurerm_virtual_network.create_cluster_vnet.name
  address_prefixes     = var.address_prefixes_openshift_cluster_subnet # azurerm_subnet expects "address_prefixes" instead of "address_prefix"
}

resource "azurerm_subnet" "create_blue_team_cluster_subnet" {
  name                 = "blueteam_cluster_subnet"
  resource_group_name  = azurerm_resource_group.create_cluster_resource_group.name
  virtual_network_name = azurerm_virtual_network.create_cluster_vnet.name
  address_prefixes     = var.address_prefixes_blueteam_cluster_subnet
}

resource "azurerm_subnet" "create_services_cluster_subnet" {
  name                 = "services_cluster_subnet"
  resource_group_name  = azurerm_resource_group.create_cluster_resource_group.name
  virtual_network_name = azurerm_virtual_network.create_cluster_vnet.name
  address_prefixes     = var.address_prefixes_services_cluster_subnet
}

resource "azurerm_subnet" "create_elk_cluster_subnet" {
  name                 = "elk_cluster_subnet"
  resource_group_name  = azurerm_resource_group.create_cluster_resource_group.name
  virtual_network_name = azurerm_virtual_network.create_cluster_vnet.name
  address_prefixes     = var.address_prefixes_elk_cluster_subnet
}
