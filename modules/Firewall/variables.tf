# Get Hub VNET details
############################################################################################################
variable "firewall_vnet_location" {
    description = "the Location of the hub VNET"
    type = string
}

variable "firewall_vnet_resource_group_name" {
    description = "the Name of the hub resource group"
    type = string
}

variable "firewall_vnet_subnet_id" {
    description = "the ID of hub subnet"
    type = string
}
############################################################################################################