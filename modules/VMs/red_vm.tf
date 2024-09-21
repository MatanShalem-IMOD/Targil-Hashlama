# # Create a network interface for the VM
# resource "azurerm_network_interface" "red_vm_nic" {
#   count = var.red_vm_count

#   name                = "red-vm-nic-${count.index + 1}"
#   location            = var.red_vnet_location
#   resource_group_name = var.cyber_resource_group_name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = var.red_vnet_subnet_id
#     private_ip_address_allocation = "Dynamic"
#   }
#   tags = {
#     owned_by = "Hashlama015"
#   }
# }

# # Use count to create multiple instances dynamically
# resource "azurerm_virtual_machine" "red_vm" {
#   count = var.red_vm_count

#   name                  = "red-vm-${count.index + 1}"
#   location              = var.red_vnet_location
#   resource_group_name   = var.cyber_resource_group_name
#   network_interface_ids = [azurerm_network_interface.red_vm_nic[count.index].id]
#   vm_size               = var.red_vm_size

#   # Specify OS disk settings
#   storage_os_disk {
#     name              = "red-vm-${count.index + 1}-osdisk"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }


#     storage_image_reference {
#         publisher = "kali-linux"
#         offer     = "kali-linux"
#         sku       = "kali"
#         version   = "latest"
#     }

#     # plan {
#     # 	name = "kali"
#     # 	publisher = "kali-linux"
#     # 	product = "kali-linux"
#     # }


#   os_profile {
#     computer_name  = "red-vm-${count.index + 1}"
#     admin_username = var.admin_username
#     admin_password = var.admin_password
#   }

#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
# }

# resource "azurerm_virtual_machine_extension" "red_vm_custom_script" {
#   count = var.red_vm_count
#   name                 = "customScript"
#   virtual_machine_id   = azurerm_virtual_machine.red_vm[count.index].id
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScript"
#   type_handler_version = "2.0"

#   settings = <<SETTINGS
#     {
#       "commandToExecute": "bash -c 'sudo useradd -m ${var.red_login_user_username} && echo ${var.red_login_user_username}:${var.red_login_user_password} | sudo chpasswd && sudo usermod -aG sudo ${var.red_login_user_username} && echo \"${var.red_login_user_username} ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers'"
#     }
#   SETTINGS

#   tags = {
#     owned_by = "Hashlama015"
#   }
# }
