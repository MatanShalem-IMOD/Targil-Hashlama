# Encryption VM section
############################################################################################################
variable "encryption_vm_nic_name" {
  description = "The name of the encryption VM nic"
  default     = "encryption-vm-nic"
}
variable "encryption_vm_name" {
  description = "The name of the encryption VM"
  default     = "encryption-vm"
}
variable "encryption_vm_size" {
  description = "The size of the encryption VM"
  default     = "Standard_B8as_v2" # Size: 8 vCPUs, 32 GiB memory
}
variable "encryption_vm_disk_name" {
  description = "The name of the encryption VM"
  default     = "encryption-vm-disk"
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


# Decryption VM section
############################################################################################################
variable "decryption_vm_nic_name" {
  description = "The name of the decryption VM nic"
  default     = "decryption-vm-nic"
}
variable "decryption_vm_name" {
  description = "The name of the decryption VM"
  default     = "decryption-vm"
}
variable "decryption_vm_size" {
  description = "The size of the decryption VM"
  default     = "Standard_B4als_v2" # Size: 4 vCPUs, 8 GiB memory
}
variable "decryption_vm_disk_name" {
  description = "The name of the decryption VM"
  default     = "decryption-vm-disk"
}
variable "decryption_vm_admin_username" {
  description = "The admin username of the decryption VM"
  default     = "mcs"
  
}
variable "decryption_vm_admin_password" {
  description = "The admin password of the decryption VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables
  
}
############################################################################################################


# Bodel VM section
############################################################################################################
variable "bodel_vm_nic_name" {
  description = "The name of the bodel VM nic"
  default     = "bodel-vm-nic"
}
variable "bodel_vm_name" {
  description = "The name of the bodel VM"
  default     = "bodel-vm"
}
variable "bodel_vm_size" {
  description = "The size of the bodel VM"
  default     = "Standard_B4als_v2" # Size: 4 vCPUs, 8 GiB memory
}
variable "bodel_vm_disk_name" {
  description = "The name of the bodel VM"
  default     = "bodel-vm-disk"
}
variable "bodel_vm_admin_username" {
  description = "The admin username of the bodel VM"
  default     = "mcs"
  
}
variable "bodel_vm_admin_password" {
  description = "The admin password of the bodel VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables
  
}
############################################################################################################