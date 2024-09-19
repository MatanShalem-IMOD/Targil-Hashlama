resource "azurerm_network_watcher" "network_watcher" {
  name                = "hashlama015-nwwatcher"
  location            = var.cluster_vnet_location
  resource_group_name = var.cluster_vnet_resource_group_name
}