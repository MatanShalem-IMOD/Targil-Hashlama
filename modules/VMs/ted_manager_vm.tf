resource "azurerm_network_interface" "ted_vm_nic" {
  name                = "ted-manager-vm-nic"
  location            = var.red_vnet_location
  resource_group_name = var.cyber_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.red_vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    owned_by = "Hashlama015"
  }
}

resource "azurerm_virtual_machine" "ted_manager_vm" {
  name                  = "ted-manager-vm"
  location              = var.red_vnet_location
  resource_group_name   = var.cyber_resource_group_name
  network_interface_ids = [azurerm_network_interface.ted_vm_nic.id]
  vm_size               = var.elk_vm_size

  delete_os_disk_on_termination    = true   # Ensure OS disk is deleted
  delete_data_disks_on_termination = true   # Ensure data disks are deleted

  storage_os_disk {
    name              = "ted-manager-vm-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

#   # Add the new data disk here
#   storage_data_disk {
#     name              = var.elk_vm_data_disk_name
#     lun               = 0 # Logical Unit Number, use 0 for the first data disk
#     caching           = "None"
#     create_option     = "Empty"
#     disk_size_gb      = var.elk_vm_data_disk_size
#     managed_disk_type = "Standard_LRS"
#   }
#   tags = {
#     owned_by = "Hashlama015"
#   }
}
