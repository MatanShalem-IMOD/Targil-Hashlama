variable "location" {
  description = "the location of the recource grup"
  default     = "West Europe"
}

##########CHECK ABOUT DNS#############

# Encryption VNET
############################################################################################################
variable "address_space_encryption_vnet" {
  description = "the address space of the vnet"
  default     = ["10.200.1.0/24"]
}

variable "dns_servers_encryption_vnet" {
  description = "the dns_servers of the vnet"
  default     = ["10.200.1.4"]
}


variable "address_prefixes_encryption_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.200.1.0/24"]
}
############################################################################################################

# Hub VNET
############################################################################################################
variable "address_space_hub_vnet" {
  description = "the address space of the vnet"
  default     = ["10.200.2.0/24"]
}

variable "dns_servers_hub_vnet" {
  description = "the dns_servers of the vnet"
  default     = ["10.200.2.4"]
}

variable "address_prefixes_main_hub_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.200.2.0/24"]
}
############################################################################################################

# Firewall VNET
############################################################################################################
variable "address_space_firewall_vnet" {
  description = "the address space of the vnet"
  default     = ["10.200.3.0/24"]
}

variable "dns_servers_firewall_vnet" {
  description = "the dns_servers of the vnet"
  default     = ["10.200.3.4"]
}

variable "address_prefixes_firewall_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.200.3.0/24"]
}
############################################################################################################

# Cluster VNET
############################################################################################################
variable "address_space_cluster_vnet" {
  description = "the address space of the vnet"
  default     = ["10.200.24.0/21"]
}

# check DNS
# variable "dns_servers_cluster_vnet" {
#   description = "the dns_servers of the vnet"
#   default     = ["10.200.16.4"]
# }

# variable "address_prefixes_openshift_cluster_subnet" {
#   description = "the address prefixes of the subnet"
#   default     = ["10.200.16.0/21"]
# }

variable "address_prefixes_blueteam_cluster_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.200.24.0/22"]
}

variable "address_prefixes_services_cluster_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.200.28.0/23"]
}

variable "address_prefixes_elk_cluster_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.200.30.0/23"]
}
############################################################################################################


# VPN VNET
############################################################################################################
variable "address_space_vpn_vnet" {
  description = "the address space of the vnet"
  default     = ["10.0.4.0/24"]
}

variable "dns_servers_vpn_vnet" {
  description = "the dns_servers of the vnet"
  default     = ["10.0.4.4"]
}

variable "address_prefixes_GatewaySubnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.0.4.0/24"]
}
############################################################################################################

# Resource Group Names
############################################################################################################
variable "cluster_resource_group_name" {
  description = "the name of the cluster resource group"
  default     = "hashlama015-cluster-rg" # Note: Change this to the correct name later
  
}

variable "encryption_resource_group_name" {
  description = "the name of the encryption resource group"
  default     = "hashlama015-encryption-rg"
  
}

variable "firewall_resource_group_name" {
  description = "the name of the firewall resource group"
  default     = "hashlama015-firewall-rg"
  
}

variable "hub_resource_group_name" {
  description = "the name of the hub resource group"
  default     = "hashlama015-hub-rg"
  
}

# variable "vpn_resource_group_name" {
#   description = "the name of the vpn resource group"
#   default     = "hashlama015-vpn-rg"
  
# }
############################################################################################################