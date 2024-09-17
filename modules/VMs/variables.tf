# Get Hub VNET details
############################################################################################################
variable "hub_vnet_location" {
  description = "the Location of the hub VNET"
  type        = string
}

variable "hub_vnet_resource_group_name" {
  description = "the Name of the hub resource group"
  type        = string
}

variable "hub_vnet_subnet_id" {
  description = "the ID of hub subnet"
  type        = string
}
############################################################################################################

# Get Cluster VNET details
############################################################################################################
variable "cluster_vnet_location" {
  description = "the Location of the cluster VNET"
  type        = string
}

variable "cluster_vnet_resource_group_name" {
  description = "the Name of the cluster resource group"
  type        = string
}

variable "cluster_kafka_subnet_id" {
  description = "the ID of services subnet"
  type        = string
}

variable "cluster_gitlab_subnet_id" {
  description = "the ID of services subnet, same as the kafka but different variable name"
  type        = string
}
variable "cluster_qlik_subnet_id" {
  description = "the ID of services subnet, same as the kafka but different variable name"
  type        = string
}

variable "cluster_elk_subnet_id" {
  description = "the ID of elk subnet"
  type        = string
}

variable "cluster_blueteam_subnet_id" {
  description = "the ID of blueteam subnet"
  type        = string
}
############################################################################################################


# Set Puller VM scetion
############################################################################################################
variable "puller_vm_nic_name" {
  description = "The name of the puller VM nic"
  default     = "puller-vm-nic"
}
variable "puller_vm_name" {
  description = "The name of the puller VM"
  default     = "puller-vm"
}
variable "puller_vm_size" {
  description = "The size of the puller VM"
  default     = "Standard_A0" # Size: 1 vCPUs, 0.75 GiB memory
}
variable "puller_vm_disk_name" {
  description = "The name of the puller VM disk"
  default     = "puller-vm-disk"
}
variable "puller_vm_admin_username" {
  description = "The admin username of the puller VM"
  default     = "mcs"

}
variable "puller_vm_admin_password" {
  description = "The admin password of the puller VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables
}
############################################################################################################

# Get Encryption VM section
############################################################################################################
variable "encryption_vnet_location" {
  description = "the Location of the cluster VNET"
  type        = string
}

variable "encryption_vnet_resource_group_name" {
  description = "the Name of the cluster resource group"
  type        = string
}

variable "encryption_vnet_subnet_id" {
  description = "the ID of services subnet"
  type        = string
}


############################################################################################################

# Set Encryption VM section
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
  description = "The name of the encryption VM disk"
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


# Set Decryption VM section
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
  description = "The name of the decryption VM disk"
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


# Set Bodel VM section
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
  description = "The name of the bodel VM disk"
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


# Set Kafka VM scetion
############################################################################################################
variable "kafka_vm_nic_name" {
  description = "The name of the kafka VM nic"
  default     = "kafka-vm-nic"
}
variable "kafka_vm_name" {
  description = "The name of the kafka VM"
  default     = "kafka-vm"
}
variable "kafka_vm_size" {
  description = "The size of the kafka VM"
  default     = "Standard_B16as_v2" # Size: 16 vCPUs, 64 GiB memory
}
variable "kafka_vm_disk_name" {
  description = "The name of the kafka VM disk"
  default     = "kafka-vm-disk"
}
variable "kafka_vm_admin_username" {
  description = "The admin username of the kafka VM"
  default     = "mcs"

}
variable "kafka_vm_admin_password" {
  description = "The admin password of the kafka VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables

}

############################################################################################################


# Set Gitlab VM scetion
############################################################################################################
variable "gitlab_vm_nic_name" {
  description = "The name of the gitlab VM nic"
  default     = "gitlab-vm-nic"
}
variable "gitlab_vm_name" {
  description = "The name of the gitlab VM"
  default     = "gitlab-vm"
}
variable "gitlab_vm_size" {
  description = "The size of the gitlab VM"
  default     = "Standard_B8als_v2" # Size: 8 vCPUs, 16 GiB memory
}
variable "gitlab_vm_disk_name" {
  description = "The name of the gitlab VM disk"
  default     = "gitlab-vm-disk"
}
variable "gitlab_vm_admin_username" {
  description = "The admin username of the gitlab VM"
  default     = "mcs"

}
variable "gitlab_vm_admin_password" {
  description = "The admin password of the gitlab VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables

}
############################################################################################################


# Set Qlik VM scetion
############################################################################################################
variable "qlik_vm_nic_name" {
  description = "The name of the qlik VM nic"
  default     = "qlik-vm-nic"
}
variable "qlik_vm_name" {
  description = "The name of the qlik VM"
  default     = "qlik-vm"
}
variable "qlik_vm_size" {
  description = "The size of the qlik VM"
  default     = "Standard_B4als_v2" # Size: 8 vCPUs, 16 GiB memory
}
variable "qlik_vm_disk_name" {
  description = "The name of the qlik VM disk"
  default     = "qlik-vm-disk"
}
variable "qlik_vm_admin_username" {
  description = "The admin username of the qlik VM"
  default     = "mcs"

}
variable "qlik_vm_admin_password" {
  description = "The admin password of the qlik VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables
}
############################################################################################################


# Set DC VM scetion
############################################################################################################
variable "dc_vm_nic_name" {
  description = "The name of the dc VM nic"
  default     = "dc-vm-nic"
}
variable "dc_vm_name" {
  description = "The name of the dc VM"
  default     = "dc-vm"
}
variable "dc_vm_size" {
  description = "The size of the dc VM"
  default     = "Standard_B2als_v2" # Size: 2 vCPUs, 4 GiB memory
}
variable "dc_vm_disk_name" {
  description = "The name of the dc VM disk"
  default     = "dc-vm-disk"
}
variable "dc_vm_admin_username" {
  description = "The admin username of the dc VM"
  default     = "mcs"

}
variable "dc_vm_admin_password" {
  description = "The admin password of the dc VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables
}
############################################################################################################


# Set ELK VM scetion
############################################################################################################
variable "elk_vm_nic_name" {
  description = "The name of the elk VM nic"
  default     = "elk-vm-nic"
}
variable "elk_vm_name" {
  description = "The name of the elk VM"
  default     = "elk-vm"
}
variable "elk_vm_size" {
  description = "The size of the elk VM"
  default     = "Standard_B8als_v2" # Size: 8 vCPUs, 16 GiB memory
}
variable "elk_vm_disk_name" {
  description = "The name of the elk VM disk"
  default     = "elk-vm-disk"
}
variable "elk_vm_admin_username" {
  description = "The admin username of the elk VM"
  default     = "mcs"

}
variable "elk_vm_admin_password" {
  description = "The admin password of the elk VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables
}
############################################################################################################


# Set Blueteam Linux VM scetion
############################################################################################################
variable "blueteam1_vm_nic_name" {
  description = "The name of the blueteam1 VM nic"
  default     = "blueteam1-vm-nic"
}
variable "blueteam1_vm_name" {
  description = "The name of the blueteam1 VM"
  default     = "blueteam1-vm"
}
variable "blueteam1_vm_size" {
  description = "The size of the blueteam1 VM"
  default     = "Standard_B4as_v2" # Size: 4 vCPUs, 16 GiB memory
}
variable "blueteam1_vm_disk_name" {
  description = "The name of the blueteam1 VM disk"
  default     = "blueteam1-vm-disk"
}
variable "blueteam1_vm_admin_username" {
  description = "The admin username of the blueteam1 VM"
  default     = "mcs"

}
variable "blueteam1_vm_admin_password" {
  description = "The admin password of the blueteam1 VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables
}
variable "blueteam2_vm_nic_name" {
  description = "The name of the blueteam2 VM nic"
  default     = "blueteam2-vm-nic"
}
variable "blueteam2_vm_name" {
  description = "The name of the blueteam2 VM"
  default     = "blueteam2-vm"
}
variable "blueteam2_vm_disk_name" {
  description = "The name of the blueteam2 VM disk"
  default     = "blueteam2-vm-disk"
}
variable "blueteam3_vm_nic_name" {
  description = "The name of the blueteam3 VM nic"
  default     = "blueteam3-vm-nic"
}
variable "blueteam3_vm_name" {
  description = "The name of the blueteam3 VM"
  default     = "blueteam3-vm"
}
variable "blueteam3_vm_disk_name" {
  description = "The name of the blueteam3 VM disk"
  default     = "blueteam3-vm-disk"
}

############################################################################################################


# Set Blueteam Windows VM scetion
############################################################################################################

variable "blueteam4_vm_size" {
  description = "The size of the blueteam1 VM"
  default     = "Standard_B8als_v4" # Size: 4 vCPUs, 8 GiB memory
}
variable "blueteam4_vm_nic_name" {
  description = "The name of the blueteam4 VM nic"
  default     = "blueteam4-vm-nic"
}
variable "blueteam4_vm_name" {
  description = "The name of the blueteam4 VM"
  default     = "blueteam4-vm"
}
variable "blueteam4_vm_disk_name" {
  description = "The name of the blueteam4 VM disk"
  default     = "blueteam4-vm-disk"
}
variable "blueteam4_vm_admin_username" {
  description = "The admin username of the blueteam4 VM"
  default     = "mcs"

}
variable "blueteam4_vm_admin_password" {
  description = "The admin password of the blueteam4 VM"
  default     = "" # NOTE: This is a sensitive variable, so it should be set in the environment variables
}
variable "blueteam5_vm_nic_name" {
  description = "The name of the blueteam5 VM nic"
  default     = "blueteam5-vm-nic"
}
variable "blueteam5_vm_name" {
  description = "The name of the blueteam5 VM"
  default     = "blueteam5-vm"
}
variable "blueteam5_vm_disk_name" {
  description = "The name of the blueteam5 VM disk"
  default     = "blueteam5-vm-disk"
}
variable "blueteam6_vm_nic_name" {
  description = "The name of the blueteam6 VM nic"
  default     = "blueteam6-vm-nic"
}
variable "blueteam6_vm_name" {
  description = "The name of the blueteam6 VM"
  default     = "blueteam6-vm"
}
variable "blueteam6_vm_disk_name" {
  description = "The name of the blueteam6 VM disk"
  default     = "blueteam6-vm-disk"
}