# Get Admin Details
############################################################################################################
variable "admin_username" {
  description = "the VM admin username"
  type        = string
}

variable "admin_password" {
  description = "the VM admin password"
  type        = string
}
# Get Cluster VNET details
############################################################################################################
variable "cluster_vnet_location" {
  description = "the Location of the cluster VNET"
  type        = string
}

variable "cluster_vnet_resource_group_name" {
  description = "the Name of the cluster resource group"
  type        = string
}

variable "cluster_vnet_id" {
  description = "the ID of the cluster VNET"
  type        = string
}

# Get Cluster Postgress Subnet details
############################################################################################################
variable "cluster_postgress_subnet_id" {
  description = "the ID of the cluster subnet"
  type        = string
}
