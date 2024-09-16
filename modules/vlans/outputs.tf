# Encryption
############################################################################################################
output "encryption_resource_group_name" {
    value = azurerm_resource_group.create_encryption_resource_group.name
    description = "the Name of encryption resource group"
}
output "encryption_vnet_name" {
  value = azurerm_virtual_network.create_encryption_vnet.name
  description = "the Name of encryption VNET"
}
output "encryption_vnet_id" {
  value = azurerm_virtual_network.create_encryption_vnet.id
  description = "the ID of encyption VNET"
}

output "encryption_subnet_name" {
  value = azurerm_subnet.create_encryption_vnet.subnet[0].name 
}

output "encryption_vnet_ip" {
  value = azurerm_virtual_network.create_encryption_vnet.subnet[0].address_prefixes[0]
}

output "encryption_subnet_id" {
  value = azurerm_subnet.create_encryption_vnet.subnet[0].id
  
}

############################################################################################################

# Hub VNET
############################################################################################################
output "hub_resource_group_name" {
    value = azurerm_resource_group.create_hub_resource_group.name
    description = "the Name of hub resource group"
}
output "hub_vnet_name" {
  value = azurerm_virtual_network.create_hub_vnet.name
  description = "the Name of hub VNET"
}
output "hub_vnet_id" {
  value = azurerm_virtual_network.create_hub_vnet.id
  description = "the ID of hub VNET"
}

output "hub_subnet_name" {
  value = azurerm_subnet.create_hub_vnet.subnet[0].name 
}

output "hub_vnet_ip" {
  value = azurerm_virtual_network.create_hub_vnet.subnet[0].address_prefixes[0]
}

output "hub_subnet_id" {
  value = azurerm_subnet.create_hub_vnet.subnet[0].id
}


############################################################################################################

# Firewall
############################################################################################################
output "firewall_resource_group_name" {
    value = azurerm_resource_group.create_firewall_resource_group.name
    description = "the Name of firewall resource group"
}
output "firewall_vnet_name" {
  value = azurerm_virtual_network.create_firewall_vnet.name
  description = "the Name of firewall VNET"
}

output "firewall_vnet_id" {
  value = azurerm_virtual_network.create_firewall_vnet.id
  description = "the ID of firewall VNET"
}

output "firewall_subnet_name" {
  value = azurerm_subnet.create_firewall_vnet.subnet[0].name 
}

output "firewall_vnet_ip" {
  value = azurerm_virtual_network.create_firewall_vnet.subnet[0].address_prefixes[0]
}

output "firewall_subnet_id" {
  value = azurerm_subnet.create_firewall_vnet.subnet[0].id
}

############################################################################################################

# Cluster
############################################################################################################
output "cluster_resource_group_name" {
    value = azurerm_resource_group.create_cluster_resource_group.name
    description = "the Name of cluster resource group"
}
output "cluster_vnet_name" {
  value = azurerm_virtual_network.create_cluster_vnet.name
  description = "the Name of cluster VNET"
}

output "cluster_vnet_id" {
  value = azurerm_virtual_network.create_cluster_vnet.id
  description = "the ID of cluster VNET"
}


############################################################################################################

# Cluster Subnets 
#########################################
output "cluster_subnet_openshift_name" {
  value = azurerm_subnet.create_cluster_vnet.openshift_cluster_subnet.name 
}
output "cluster_subnet_openshift_ip" {
  value = azurerm_virtual_network.create_cluster_vnet.openshift_cluster_subnet.address_prefixes[0]
}
output "cluster_subnet_openshift_id" {
  value = azurerm_subnet.create_cluster_vnet.openshift_cluster_subnet.id
}

output "cluster_subnet_blueteam_name" {
  value = azurerm_subnet.create_cluster_vnet.blueteam_cluster_subnet.name 
}
output "cluster_subnet_blueteam_ip" {
  value = azurerm_virtual_network.create_cluster_vnet.blueteam_cluster_subnet.address_prefixes[0]
}
output "cluster_subnet_blueteam_id" {
  value = azurerm_subnet.create_cluster_vnet.blueteam_cluster_subnet.id
}

output "cluster_subnet_services_name" {
  value = azurerm_subnet.create_cluster_vnet.services_cluster_subnet.name 
}
output "cluster_subnet_services_ip" {
  value = azurerm_virtual_network.create_cluster_vnet.services_cluster_subnet.address_prefixes[0]
}

output "cluster_subnet_services_id" {
  value = azurerm_subnet.create_cluster_vnet.services_cluster_subnet.id
}

output "cluster_subnet_elk_name" {
  value = azurerm_subnet.create_cluster_vnet.elk_cluster_subnet.name 
}
output "cluster_subnet_elk_ip" {
  value = azurerm_virtual_network.create_cluster_vnet.elk_cluster_subnet.address_prefixes[0]
}

output "cluster_subnet_elk_id" {
  value = azurerm_subnet.create_cluster_vnet.elk_cluster_subnet.id
}
#########################################