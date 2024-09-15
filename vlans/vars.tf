variable "location" {
  description = "the location of the recource grup"
  default     = "West Europe"
}

##########CHANGE IPS AND CHECK ABOUT DNS#############

### Encryption VNET
variable "address_space_encryption_vnet" {
  description = "the address space of the vnet"
  default     = ["10.0.0.0/32"]
}

variable "dns_servers_encryption_vnet" {
  description = "the dns_servers of the vnet"
  default     = ["10.0.0.4"]
}


variable "address_prefixes_encryption_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.0.0.0/30"]
}

### Hub VNET
variable "address_space_hub_vnet" {
  description = "the address space of the vnet"
  default     = ["10.0.1.0/24"]
}

variable "dns_servers_hub_vnet" {
  description = "the dns_servers of the vnet"
  default     = ["10.0.1.4"]
}

variable "address_prefixes_main_hub_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.0.1.0/24"]
}


### Cluster VNET
variable "address_space_cluster_vnet" {
  description = "the address space of the vnet"
  default     = ["10.1.0.0/16"]
}

variable "dns_servers_cluster_vnet" {
  description = "the dns_servers of the vnet"
  default     = ["10.1.0.4"]
}

variable "address_prefixes_openshift_cluster_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.1.0.0/18"]
}

variable "address_prefixes_blueteam_cluster_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.1.64.0/24"]
}

variable "address_prefixes_services_cluster_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.1.65.0/25"]
}

variable "address_prefixes_elk_cluster_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.1.65.0/25"]
}

### Firewall VNET
variable "address_space_firewall_vnet" {
  description = "the address space of the vnet"
  default     = ["10.0.2.0/24"]
}

variable "dns_servers_firewall_vnet" {
  description = "the dns_servers of the vnet"
  default     = ["10.0.2.4"]
}

variable "address_prefixes_firewall_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.0.2.0/24"]
}