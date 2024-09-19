# resource "azurerm_network_interface" "postgres_vm_nic" {
#   name                = var.postgres_vm_nic_name
#   location            = var.cluster_vnet_location
#   resource_group_name = var.cluster_vnet_resource_group_name

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = var.cluster_postgres_subnet_id
#     private_ip_address_allocation = "Dynamic"
#   }
#   tags = {
#     owned_by = "Hashlama015"
#   }
# }

# resource "azurerm_virtual_machine" "postgres_vm" {
#   name                  = var.postgres_vm_name
#   location              = var.cluster_vnet_location
#   resource_group_name   = var.cluster_vnet_resource_group_name
#   network_interface_ids = [azurerm_network_interface.postgres_vm_nic.id]
#   vm_size               = var.postgres_vm_size

#   delete_os_disk_on_termination    = true   # Ensure OS disk is deleted
#   delete_data_disks_on_termination = true   # Ensure data disks are deleted

#   storage_os_disk {
#     name              = var.postgres_vm_disk_name
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }

#   storage_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts-gen2"
#     version   = "latest"
#   }

#   os_profile {
#     computer_name  = "hostname"
#     admin_username = var.admin_username
#     admin_password = var.admin_password
#   }

#   os_profile_linux_config {
#     disable_password_authentication = false
#   }

#   # Add the new data disk here
#   storage_data_disk {
#     name              = var.postgres_data_disk_name
#     lun               = 0 # Logical Unit Number, use 0 for the first data disk
#     caching           = "None"
#     create_option     = "Empty"
#     disk_size_gb      = var.postgres_data_disk_size
#     managed_disk_type = "Standard_LRS"
#   }
#   tags = {
#     owned_by = "Hashlama015"
#   }
# }

# resource "azurerm_virtual_machine_extension" "postgres_vm_custom_script" {
#   name                 = "customScript"
#   virtual_machine_id   = azurerm_virtual_machine.postgres_vm.id
#   publisher            = "Microsoft.Azure.Extensions"
#   type                 = "CustomScript"
#   type_handler_version = "2.0"

#   settings = <<SETTINGS
#     {
#       "commandToExecute": "bash -c 'sudo useradd -m ${var.cyber_login_user_username} && echo ${var.cyber_login_user_username}:${var.cyber_login_user_password} | sudo chpasswd && sudo usermod -aG sudo ${var.cyber_login_user_username} && echo \"${var.cyber_login_user_username} ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers'"
#     }
#   SETTINGS

#   tags = {
#     owned_by = "Hashlama015"
#   }
# }