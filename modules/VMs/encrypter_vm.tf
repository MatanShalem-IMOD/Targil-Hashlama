resource "azurerm_network_interface" "encryption_vm_nic" {
  name                = var.encryption_vm_nic_name
  location            = var.hub_vnet_location
  resource_group_name = var.hub_vnet_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.hub_vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

# Data Disk
resource "azurerm_managed_disk" "data_disk" {
  name                 = "encrypter-data-disk"
  location             = var.hub_vnet_location
  resource_group_name  = var.hub_vnet_resource_group_name
  storage_account_type = "Standard_LRS"
  disk_size_gb         = 8 # Size of the data disk in GB
  create_option        = "Empty"
}

resource "azurerm_virtual_machine" "encryption_vm" {
  name                  = var.encryption_vm_name
  location              = var.hub_vnet_location
  resource_group_name   = var.hub_vnet_resource_group_name
  network_interface_ids = [azurerm_network_interface.encryption_vm_nic.id]
  vm_size               = var.encryption_vm_size

  storage_os_disk {
    name              = var.encryption_vm_disk_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "22_04-lts"
    version   = "latest"
  }

  os_profile {
    computer_name  = "hostname"
    admin_username = var.encryption_vm_admin_username
    admin_password = var.encryption_vm_admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }



}

# Attach the managed data disk
resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.data_disk.id
  virtual_machine_id = azurerm_virtual_machine.encryption_vm.id
  lun                = "0"
  caching            = "ReadWrite"
}
