resource "azurerm_public_ip" "example" {
    name                = "example-pip"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    allocation_method   = "Static"
    sku                 = "Standard"
}

resource "azurerm_firewall" "example" {
    name                = "example-firewall"
    location            = azurerm_resource_group.example.location
    resource_group_name = azurerm_resource_group.example.name
    sku_name            = "AZFW_VNet"
    sku_tier            = "Standard"

    ip_configuration {
        name                 = "configuration"
        subnet_id            = azurerm_subnet.example.id
        public_ip_address_id = azurerm_public_ip.example.id
    }
}

resource "azurerm_firewall_policy" "example" {
    name                = "example-firewall-policy"
    resource_group_name = azurerm_resource_group.example.name
    location            = azurerm_resource_group.example.location
}