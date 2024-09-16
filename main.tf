module "vlans" {
  source = "./modules/vlans"
}

module "vms" {
  source = "./modules/VMs"

  # Pass the output from the vlans module to the vms module
  
}

module "peering" {
  source = "./modules/peering"

  # Pass the output from the vlans module to the peering module
  encryption_vnet_id = module.vlans.encryption_vnet_id
  hub_vnet_id = module.vlans.hub_vnet_id
  firewall_vnet_id = module.vlans.firewall_vnet_id
  cluster_vnet_id = module.vlans.cluster_vnet_id

  encryption_vnet_name = module.vlans.encryption_vnet_name
  hub_vnet_name = module.vlans.hub_vnet_name
  firewall_vnet_name = module.vlans.firewall_vnet_name
  cluster_vnet_name = module.vlans.cluster_vnet_name
}