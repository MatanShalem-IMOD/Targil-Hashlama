resource "azurerm_private_dns_zone" "create_private_dns_zone" {
  name                = "hashlama015.postgres.database.azure.com"
  resource_group_name = var.cluster_vnet_resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "create_private_dns_zone_virtual_network_link_to_cluster_vnet" {
  name                  = "dns-zone-link-to-cluster-vnet"
  private_dns_zone_name = azurerm_private_dns_zone.create_private_dns_zone.name
  virtual_network_id    = var.cluster_vnet_id
  resource_group_name   = var.cluster_vnet_resource_group_name
  depends_on            = [azurerm_subnet.example]
}

resource "azurerm_postgresql_flexible_server" "create_db_server" {
  name                          = "hashlama-psql-server"
  resource_group_name           = var.cluster_vnet_resource_group_name
  location                      = var.cluster_vnet_location
  version                       = "16"
  delegated_subnet_id           = var.cluster_postgress_subnet_id
  private_dns_zone_id           = azurerm_private_dns_zone.create_private_dns_zone.id
  public_network_access_enabled = false
  administrator_login           = var.admin_username
  administrator_password        = var.admin_password
  zone                          = "1"

  storage_mb   = 100000
  storage_tier = "P30"

  sku_name   = "GP_Standard_D4s_v3"
  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]

}