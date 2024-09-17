variable "acr_name" {
  description = "The name of the container registry"
  default     = "hashlama015acr"
}

variable "cluster_vnet_location" {
  description = "the Location of the cluster VNET"
  type        = string
}

variable "cluster_vnet_resource_group_name" {
  description = "the Name of the cluster resource group"
  type        = string
}
