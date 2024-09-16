module "hub_vnet" {
    source = "../vlans/"
}

resource "azurerm_network_interface" "bodel_vm_nic" {
    name                = var.bodel_vm_nic_name
    location            = module.hub_vnet.location
    resource_group_name = module.hub_vnet.resource_group_name

    ip_configuration {
        name                          = "internal"
        subnet_id                     = module.hub_vnet.subnet_id
        private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_virtual_machine" "bodel_vm" {
    name                  = var.bodel_vm_name
    location              = module.hub_vnet.location
    resource_group_name   = module.hub_vnet.resource_group_name
    network_interface_ids = [azurerm_network_interface.example.id]
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