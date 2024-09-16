
# Encrypter VM section
############################################################################################################
variable "encryption_vm_name" {
  description = "The name of the encryption VM"
  default     = "encryption_vm"
}
variable "encryption_vm_size" {
  description = "The size of the encryption VM"
  default     = "Standard_D8as_v5"
}
variable "encryption_vm_disk_name" {
  description = "The name of the encryption VM"
  default     = "encryption_vm_disk"
}
variable "encryption_vm_admin_username" {
  description = "The admin username of the encryption VM"
  default     = "mcs"
  
}
variable "encryption_vm_admin_password" {
  description = "The admin password of the encryption VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables
  
}
############################################################################################################