
resource "azurerm_container_registry" "acr" {
  name                     = var.acr_name
  resource_group_name      = var.cluster_vnet_resource_group_name
  location                 = var.cluster_vnet_location
  sku                      = "Basic"
  admin_enabled            = true
    tags = {
    owned_by = "Hashlama015"
  }
}