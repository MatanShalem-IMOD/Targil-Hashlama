module "vlans" {
  source = "./modules/vlans"
}

module "vms" {
  source = "./modules/VMs"

  # Pass the output from the vlans module to the vms module
  
}
