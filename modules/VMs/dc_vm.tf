resource "azurerm_network_interface" "dc_vm_nic" {
  name                = var.dc_vm_nic_name
  location            = var.cluster_vnet_location
  resource_group_name = var.cluster_vnet_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.cluster_qlik_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    owned_by = "Hashlama015"
  }
}

resource "azurerm_virtual_machine" "dc_vm" {
  name                  = var.dc_vm_name
  location              = var.cluster_vnet_location
  resource_group_name   = var.cluster_vnet_resource_group_name
  network_interface_ids = [azurerm_network_interface.dc_vm_nic.id]
  vm_size               = var.dc_vm_size

  delete_os_disk_on_termination    = true   # Ensure OS disk is deleted
  delete_data_disks_on_termination = true   # Ensure data disks are deleted

  storage_os_disk {
    name              = var.dc_vm_disk_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

   storage_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_windows_config {
    # disable_password_authentication = false
  }
  
  tags = {
    owned_by = "Hashlama015"
  }
}