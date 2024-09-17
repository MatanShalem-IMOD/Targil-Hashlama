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

#########reverse peering################
resource "azurerm_virtual_network_peering" "create_peer_hub_to_encryption" {
  name                      = "hub-to-encryption"
  resource_group_name       = var.hub_resource_group_name
  virtual_network_name      = var.hub_vnet_name
  remote_virtual_network_id = var.encryption_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
    allow_gateway_transit = false
}

#######################################

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

#########reverse peering################
resource "azurerm_virtual_network_peering" "create_peer_firewall_to_hub" {
  name                      = "firewall-to-hub"
  resource_group_name       = var.firewall_resource_group_name
  virtual_network_name      = var.firewall_vnet_name
  remote_virtual_network_id = var.hub_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
    allow_gateway_transit = false
}

#######################################


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

#########reverse peering################
resource "azurerm_virtual_network_peering" "create_peer_cluster_to_firewall" {
  name                      = "cluster-to-firewall"
  resource_group_name       = var.cluster_resource_group_name
  virtual_network_name      = var.cluster_vnet_name
  remote_virtual_network_id = var.firewall_vnet_id

  allow_virtual_network_access = true
  allow_forwarded_traffic      = true

  # `allow_gateway_transit` must be set to false for vnet Global Peering
    allow_gateway_transit = false
}

#######################################

# resource "azurerm_virtual_network_peering" "create_peer_vpn_to_cluster" {
#   name                      = "cluster-to-vpn"
#   resource_group_name       = var.vpn_resource_group_name
#   virtual_network_name      = var.vpn_vnet_name
#   remote_virtual_network_id = var.cluster_vnet_id

#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = true

#   # `allow_gateway_transit` must be set to false for vnet Global Peering
#   allow_gateway_transit = true
# }

# resource "azurerm_virtual_network_peering" "create_peer_vpn_to_encryption" {
#   name                      = "vpn-to-encryption"
#   resource_group_name       = var.vpn_resource_group_name
#   virtual_network_name      = var.vpn_vnet_name
#   remote_virtual_network_id = var.encryption_vnet_id

#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = true

#   # `allow_gateway_transit` must be set to false for vnet Global Peering
#   allow_gateway_transit = true
# }

# resource "azurerm_virtual_network_peering" "create_peer_vpn_to_hub" {
#   name                      = "vpn-to-hub"
#   resource_group_name       = var.vpn_resource_group_name
#   virtual_network_name      = var.vpn_vnet_name
#   remote_virtual_network_id = var.hub_vnet_id

#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = true

#   # `allow_gateway_transit` must be set to false for vnet Global Peering
#   allow_gateway_transit = true
# }

# resource "azurerm_virtual_network_peering" "create_peer_vpn_to_firewall" {
#   name                      = "vpn-to-firewall"
#   resource_group_name       = var.vpn_resource_group_name
#   virtual_network_name      = var.vpn_vnet_name
#   remote_virtual_network_id = var.firewall_vnet_id

#   allow_virtual_network_access = true
#   allow_forwarded_traffic      = true

#   # `allow_gateway_transit` must be set to false for vnet Global Peering
#   allow_gateway_transit = true
# }