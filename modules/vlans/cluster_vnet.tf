resource "azurerm_resource_group" "create_cluster_resource_group" {
  name     = "cluster_resource_group"
  location = vars.location
}

# create virtual network and subnet for cluster
resource "azurerm_virtual_network" "create_cluster_vnet" {
  name                = "cluster_vnet"
  location            = azurerm_resource_group.create_cluster_resource_group.location
  resource_group_name = azurerm_resource_group.create_cluster_resource_group.name
  address_space       = vars.address_space_cluster_vnet
  #dns_servers         = vars.dns_servers_cluster_vnet

  subnet {
    name             = "openshift_cluster_subnet"
    address_prefixes = vars.address_prefixes_openshift_cluster_subnet
  }
  subnet {
    name             = "blueteam_cluster_subnet"
    address_prefixes = vars.address_prefixes_blueteam_cluster_subnet
  }
  subnet {
    name             = "services_cluster_subnet"
    address_prefixes = vars.address_prefixes_services_cluster_subnet
  }
  subnet {
    name             = "elk_cluster_subnet"
    address_prefixes = vars.address_prefixes_elk_cluster_subnet
  }


  tags = {
    team = "tashtiot"
  }
}

