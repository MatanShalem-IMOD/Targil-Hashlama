provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

module "vlans" {
  source = "./modules/vlans"
}

<<<<<<< HEAD
=======

locals {
  admin_username = jsondecode(file("./credentials.json")).admin_username.value
  admin_password = jsondecode(file("./credentials.json")).admin_password.value
}

>>>>>>> Dev-no-rgs
module "vms" {
  source = "./modules/VMs"

  # Pass the output from the vlans module to the vms module

<<<<<<< HEAD
  # Hub Details
  hub_vnet_location = module.vlans.hub_vnet_location
  hub_vnet_resource_group_name = module.vlans.hub_resource_group_name
  hub_vnet_subnet_id = module.vlans.hub_subnet_id
=======
  admin_username = local.admin_username
  admin_password = local.admin_password

  # encryption details
  encryption_vnet_location            = module.vlans.encryption_vnet_location
  encryption_vnet_resource_group_name = module.vlans.encryption_resource_group_name
  encryption_vnet_subnet_id           = module.vlans.encryption_subnet_id

  # Hub Details
  hub_vnet_location            = module.vlans.hub_vnet_location
  hub_vnet_resource_group_name = module.vlans.hub_resource_group_name
  hub_vnet_subnet_id           = module.vlans.hub_subnet_id
>>>>>>> Dev-no-rgs

  # Cluster Details
  # cluster_vnet_location = module.vlans.cluster_vnet_location
  # cluster_vnet_resource_group_name = module.vlans.cluster_resource_group_name
  # cluster_kafka_subnet_id = module.vlans.cluster_vnet_id
<<<<<<< HEAD
  cluster_vnet_location = module.vlans.cluster_vnet_location
  cluster_vnet_resource_group_name = module.vlans.cluster_resource_group_name
  cluster_kafka_subnet_id = module.vlans.cluster_subnet_services_id
  cluster_gitlab_subnet_id = module.vlans.cluster_subnet_services_id
  cluster_elk_subnet_id = module.vlans.cluster_subnet_services_id
=======
  cluster_vnet_location            = module.vlans.cluster_vnet_location
  cluster_vnet_resource_group_name = module.vlans.cluster_resource_group_name
  cluster_kafka_subnet_id          = module.vlans.cluster_subnet_services_id
  cluster_gitlab_subnet_id         = module.vlans.cluster_subnet_services_id
  cluster_qlik_subnet_id         = module.vlans.cluster_subnet_services_id
  cluster_elk_subnet_id            = module.vlans.cluster_subnet_services_id
  cluster_blueteam_subnet_id            = module.vlans.cluster_subnet_services_id
>>>>>>> Dev-no-rgs
}

module "peering" {
  source = "./modules/peering"

  # Pass the output from the vlans module to the peering module
  encryption_vnet_id = module.vlans.encryption_vnet_id
<<<<<<< HEAD
  hub_vnet_id = module.vlans.hub_vnet_id
  firewall_vnet_id = module.vlans.firewall_vnet_id
  cluster_vnet_id = module.vlans.cluster_vnet_id

  encryption_vnet_name = module.vlans.encryption_vnet_name
  hub_vnet_name = module.vlans.hub_vnet_name
  firewall_vnet_name = module.vlans.firewall_vnet_name
  cluster_vnet_name = module.vlans.cluster_vnet_name

  encryption_resource_group_name = module.vlans.encryption_resource_group_name
  hub_resource_group_name = module.vlans.hub_resource_group_name
  firewall_resource_group_name = module.vlans.firewall_resource_group_name
  cluster_resource_group_name = module.vlans.cluster_resource_group_name
}
=======
  hub_vnet_id        = module.vlans.hub_vnet_id
  # firewall_vnet_id   = module.vlans.firewall_vnet_id
  cluster_vnet_id    = module.vlans.cluster_vnet_id
  # vpn_vnet_id        = module.vlans.vpn_vnet_id

  encryption_vnet_name = module.vlans.encryption_vnet_name
  hub_vnet_name        = module.vlans.hub_vnet_name
  # firewall_vnet_name   = module.vlans.firewall_vnet_name
  cluster_vnet_name    = module.vlans.cluster_vnet_name
  # vpn_vnet_name        = module.vlans.vpn_vnet_name

  encryption_resource_group_name = module.vlans.encryption_resource_group_name
  hub_resource_group_name        = module.vlans.hub_resource_group_name
  # firewall_resource_group_name   = module.vlans.firewall_resource_group_name
  cluster_resource_group_name    = module.vlans.cluster_resource_group_name
  # vpn_resource_group_name        = module.vlans.vpn_resource_group_name
}

module "registry" {
  source = "./modules/registry"

  # Pass the output from the vlans module to the registry module
  cluster_vnet_location            = module.vlans.cluster_vnet_location
  cluster_vnet_resource_group_name = module.vlans.cluster_resource_group_name
}

module "blob_storage" {
  source = "./modules/BlobStorage"

  # Pass the output from the vlans module to the blob storage module 
}

# module "network_watcher" {
#   source = "./modules/NetworkWatcher"

#   # Pass the output from the vlans module to the network watcher module
  
# }


# module "firewall" {
#   source = "./modules/Firewall"

#   # Pass the output from the vlans module to the firewall module
#   firewall_vnet_location            = module.vlans.firewall_vnet_location
#   firewall_vnet_resource_group_name = module.vlans.firewall_resource_group_name
#   firewall_vnet_subnet_id           = module.vlans.firewall_subnet_id
  
# }
>>>>>>> Dev-no-rgs
