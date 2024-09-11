variable "location" {
  description = "the location of the recource grup"
  default     = "West Europe"
}


### Encryption VNET
variable "address_space_encryption_vnet" {
  description = "the address space of the vnet"
  default     = ["10.0.0.0/32"]
}

variable "dns_servers_encryption_vnet" {
  description = "the dns_servers of the vnet"
  default     = ["10.0.0.1"]
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
  default     = ["10.0.1.1"]
}

variable "address_prefixes_hub_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.0.1.1/25"]
}

variable "address_prefixes_firewall_hub_subnet" {
  description = "the address prefixes of the subnet"
  default     = ["10.0.0.128/25"]
}