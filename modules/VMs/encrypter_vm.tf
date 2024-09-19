resource "azurerm_network_interface" "encryption_vm_nic" {
  name                = var.encryption_vm_nic_name
<<<<<<< HEAD
  location            = var.hub_vnet_location
  resource_group_name = var.hub_vnet_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.hub_vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
=======
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
>>>>>>> Dev-no-rgs
}

# Data Disk
resource "azurerm_managed_disk" "data_disk" {
  name                 = "encrypter-data-disk"
<<<<<<< HEAD
  location             = var.hub_vnet_location
  resource_group_name  = var.hub_vnet_resource_group_name
  storage_account_type = "Standard_LRS"
  disk_size_gb         = 8 # Size of the data disk in GB
  create_option        = "Empty"
=======
  location             = var.encryption_vnet_location
  resource_group_name  = var.encryption_vnet_resource_group_name
  storage_account_type = "Standard_LRS"
  disk_size_gb         = 8 # Size of the data disk in GB
  create_option        = "Empty"
  tags = {
    owned_by = "Hashlama015"
  }
>>>>>>> Dev-no-rgs
}

resource "azurerm_virtual_machine" "encryption_vm" {
  name                  = var.encryption_vm_name
<<<<<<< HEAD
  location              = var.hub_vnet_location
  resource_group_name   = var.hub_vnet_resource_group_name
  network_interface_ids = [azurerm_network_interface.encryption_vm_nic.id]
  vm_size               = var.encryption_vm_size

=======
  location              = var.encryption_vnet_location
  resource_group_name   = var.encryption_vnet_resource_group_name
  network_interface_ids = [azurerm_network_interface.encryption_vm_nic.id]
  vm_size               = var.encryption_vm_size

  delete_os_disk_on_termination    = true   # Ensure OS disk is deleted
  delete_data_disks_on_termination = true   # Ensure data disks are deleted

>>>>>>> Dev-no-rgs
  storage_os_disk {
    name              = var.encryption_vm_disk_name
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
<<<<<<< HEAD
    offer     = "UbuntuServer"
    sku       = "22_04-lts"
=======
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
>>>>>>> Dev-no-rgs
    version   = "latest"
  }

  os_profile {
    computer_name  = "hostname"
<<<<<<< HEAD
    admin_username = var.encryption_vm_admin_username
    admin_password = var.encryption_vm_admin_password
=======
    admin_username = var.admin_username
    admin_password = var.admin_password
>>>>>>> Dev-no-rgs
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
<<<<<<< HEAD



=======
  tags = {
    owned_by = "Hashlama015"
  }
>>>>>>> Dev-no-rgs
}

# Attach the managed data disk
resource "azurerm_virtual_machine_data_disk_attachment" "example" {
  managed_disk_id    = azurerm_managed_disk.data_disk.id
  virtual_machine_id = azurerm_virtual_machine.encryption_vm.id
  lun                = "0"
  caching            = "ReadWrite"
}
