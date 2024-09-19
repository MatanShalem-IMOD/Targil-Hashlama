data "azurerm_resource_group" "existing_cyber_rg" {
  name     = var.cyber_resource_group_name
}

resource "azurerm_network_watcher" "network_watcher" {
  name                = "hashlama015-nwwatcher"
  location            = data.existing_cyber_rg.location
  resource_group_name = data.existing_cyber_rg.name
}