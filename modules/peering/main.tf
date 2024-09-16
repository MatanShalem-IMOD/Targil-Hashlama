resource "azurerm_virtual_network_peering" "create_peer_encryption_to_hub" {
  name                      = "encryption-to-hub"
  resource_group_name       = var.encryption_resource_group_name
  virtual_network_name      = var.encryption_vnet_name
  remote_virtual_network_id = var.hub_vnet_id
  
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false
}

resource "azurerm_virtual_network_peering" "create_peer_hub_to_firewall" {
  name                      = "hub-to-firewall"
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.firewall_vnet_id 

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false
}

resource "azurerm_virtual_network_peering" "create_peer_firewall_to_cluster" {
  name                      = "firewall-to-cluster"
  resource_group_name       = var.firewall_resource_group_name
  virtual_network_name      = var.firewall_vnet_name
  remote_virtual_network_id = var.cluster_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
  allow_gateway_transit = false
}