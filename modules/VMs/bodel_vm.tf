resource "azurerm_network_interface" "bodel_vm_nic" {
<<<<<<< HEAD
    name                = var.bodel_vm_nic_name
    location            = var.hub_vnet_location
    resource_group_name = var.hub_vnet_resource_group_name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = var.hub_vnet_subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "bodel_vm" {
    name                  = var.bodel_vm_name
    location              = var.hub_vnet_location
    resource_group_name   = var.hub_vnet_resource_group_name
    network_interface_ids = [azurerm_network_interface.bodel_vm_nic.id]
    vm_size               = var.bodel_vm_size

    storage_os_disk {
        name              = var.bodel_vm_disk_name
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
        admin_username = var.bodel_vm_admin_username
        admin_password = var.bodel_vm_admin_password
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }
}
=======
  name                = var.bodel_vm_nic_name
  location            = var.hub_vnet_location
  resource_group_name = var.hub_vnet_resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.hub_vnet_subnet_id
    private_ip_address_allocation = "Dynamic"
  }
  tags = {
    owned_by = "Hashlama015"
  }
}

resource "azurerm_virtual_machine" "bodel_vm" {
  name                  = var.bodel_vm_name
  location              = var.hub_vnet_location
  resource_group_name   = var.hub_vnet_resource_group_name
  network_interface_ids = [azurerm_network_interface.bodel_vm_nic.id]
  vm_size               = var.bodel_vm_size

  delete_os_disk_on_termination    = true   # Ensure OS disk is deleted
  delete_data_disks_on_termination = true   # Ensure data disks are deleted

  storage_os_disk {
    name              = var.bodel_vm_disk_name
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
>>>>>>> Dev-no-rgs
