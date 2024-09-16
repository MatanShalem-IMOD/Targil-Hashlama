############################################
# Module Input Variables passed from vlans module
#venet IDs
variable "encryption_vnet_id" {
    description = "the ID of encryption VNET"
    type = string
}
variable "hub_vnet_id" {
    description = "the ID of hub VNET"
    type = string
}
variable "firewall_vnet_id" {
    description = "the ID of firewall VNET"
    type = string
}
variable "cluster_vnet_id" {
    description = "the ID of cluster VNET"
    type = string
}
#venet names
variable "encryption_vnet_name" {
    description = "the name of encryption VNET"
    type = string
}
variable "hub_vnet_name" {
    description = "the name of hub VNET"
    type = string
}
variable "firewall_vnet_name" {
    description = "the name of firewall VNET"
    type = string
}
variable "cluster_vnet_name" {
    description = "the name of cluster VNET"
    type = string
}
#venet resource group names
variable "encryption_resource_group_name" {
    description = "the name of encryption resource group"
    type = string
}
variable "hub_resource_group_name" {
    description = "the name of hub resource group"
    type = string
}
variable "firewall_resource_group_name" {
    description = "the name of firewall resource group"
    type = string
}
#variable "cluster_resource_group_name" {
#    description = "the name of cluster resource group"
#    type = string
#}
############################################