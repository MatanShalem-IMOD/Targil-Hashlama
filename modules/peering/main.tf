resource "azurerm_virtual_network_peering" "create_peer_encryption_to_hub" {
  name                      = "encryption-to-hub"
  resource_group_name       = azurerm_resource_group.example.name #####WHAT RESOURCE GROUP IS THIS?
  virtual_network_name      = var.encryption_vnet_name
  remote_virtual_network_id = var.hub_vnet_id
}

resource "azurerm_virtual_network_peering" "create_peer_hub_to_firewall" {
  name                      = "hub-to-firewall"
  resource_group_name       = azurerm_resource_group.example.name #####WHAT RESOURCE GROUP IS THIS?
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.firewall_vnet_id 
}

resource "azurerm_virtual_network_peering" "create_peer_firewall_to_cluster" {
  name                      = "firewall-to-cluster"
  resource_group_name       = azurerm_resource_group.example.name #####WHAT RESOURCE GROUP IS THIS?
  virtual_network_name      = var.firewall_vnet_name
  remote_virtual_network_id = var.cluster_vnet_id
}