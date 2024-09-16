############################################
# Module Input Variables passed from vlans module
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
############################################