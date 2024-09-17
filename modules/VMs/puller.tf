resource "azurerm_network_interface" "puller_vm_nic" {
  name                = var.puller_vm_nic_name
  location            = var.encryption_vnet_location
  resource_group_name = var.encryption_vnet_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.encryption_vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    owned_by = "Hashlama015"
  }
}

resource "azurerm_virtual_machine" "puller_vm" {
  name                  = var.puller_vm_name
  location              = var.encryption_vnet_location
  resource_group_name   = var.encryption_vnet_resource_group_name
  network_interface_ids = [azurerm_network_interface.puller_vm_nic.id]
  vm_size               = var.puller_vm_size

  delete_os_disk_on_termination    = true   # Ensure OS disk is deleted
  delete_data_disks_on_termination = true   # Ensure data disks are deleted

  storage_os_disk {
    name              = var.puller_vm_disk_name
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
  tags = {
    owned_by = "Hashlama015"
  }
}
