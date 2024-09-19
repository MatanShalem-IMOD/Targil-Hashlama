# Get RG Details
data "azurerm_resource_group" "existing_cluster_rg" {
  name     = var.tashtiot_resource_group_name
}

# Create Storage Account
resource "azurerm_storage_account" "hashlama015_storage_account" {
  name                     = "hashlama015blobs"
  resource_group_name      = data.azurerm_resource_group.existing_cluster_rg.name
  location                 = data.azurerm_resource_group.existing_cluster_rg.location
  account_tier             = "Standard" # Standard or Premium (This sets up Hot storage for now so change it in the UI)
  account_replication_type = "LRS"
  tags = {
    owned_by = "Hashlama015"
  }
  
}

# Create Blob Container
resource "azurerm_storage_container" "engineers_blob_container" {
  name                  = "engineersblobcontainer"
  storage_account_name  = azurerm_storage_account.hashlama015_storage_account.name
  container_access_type = "blob"
}

# Create Blob Container
resource "azurerm_storage_container" "internal_blob_container" {
  name                  = "internalblobcontainer"
  storage_account_name  = azurerm_storage_account.hashlama015_storage_account.name
  container_access_type = "blob"
}