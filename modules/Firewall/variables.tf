# Get firewall VNET details
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

# Set Firewall section
############################################################################################################
variable "firewall_public_ip_name" {
  description = "The name of the firewall public ip"
  default     = "hashlama-firewall-pip"
  
}

variable "firewall_nic_name" {
  description = "The name of the firewall nic"
  default     = "hashlama-firewall-nic"
}
variable "firewall_name" {
  description = "The name of the firewall"
  default     = "hashlama-firewall"
}

variable "firewall_policy_name" {
  description = "The name of the firewall policy"
  default     = "hashlama-firewall-policy"
  
}
############################################################################################################
