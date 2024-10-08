resource "azurerm_network_interface" "de_lb_vm_nic" {
  name                = "de-lb-vm-nic"
  location            = var.cluster_vnet_location
  resource_group_name = var.cluster_vnet_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.cluster_kafka_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    owned_by = "Hashlama015"
  }
}

resource "azurerm_virtual_machine" "de_lb_vm" {
  name                  = "de-lb-vm"
  location              = var.cluster_vnet_location
  resource_group_name   = var.cluster_vnet_resource_group_name
  network_interface_ids = [azurerm_network_interface.de_lb_vm_nic.id]
  vm_size               = "Standard_B4ls_v2"

  delete_os_disk_on_termination    = true   # Ensure OS disk is deleted
  delete_data_disks_on_termination = true   # Ensure data disks are deleted

  storage_os_disk {
    name              = "de-lb-vm-osdisk"
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

resource "azurerm_virtual_machine_extension" "de-lb_vm_custom_script" {
  name                 = "customScript"
  virtual_machine_id   = azurerm_virtual_machine.de_lb_vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
      "commandToExecute": "bash -c 'sudo useradd -m ${var.cyber_login_user_username} && echo ${var.cyber_login_user_username}:${var.cyber_login_user_password} | sudo chpasswd && sudo usermod -aG sudo ${var.cyber_login_user_username} && echo \"${var.cyber_login_user_username} ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers'"
    }
  SETTINGS

  tags = {
    owned_by = "Hashlama015"
  }
}