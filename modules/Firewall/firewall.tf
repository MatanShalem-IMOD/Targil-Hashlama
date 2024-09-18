# # Create Firewall Public IP
# resource "azurerm_public_ip" "firewall_pip" {
#     name                = var.firewall_public_ip_name
#     location            = var.firewall_vnet_location
#     resource_group_name = var.firewall_vnet_resource_group_name
#     allocation_method   = "Static"
#     sku                 = "Standard"
#     tags = {
#     owned_by = "Hashlama015"
#     }
# }

# Create Firewall Policy
resource "azurerm_firewall_policy" "firewall_policy" {
    name                = var.firewall_policy_name
    resource_group_name = var.firewall_vnet_resource_group_name
    location            = var.firewall_vnet_location
    tags = {
    owned_by = "Hashlama015"
    }
}

# Create Firewall Policy Rule Collection Group
resource "azurerm_firewall_policy_rule_collection_group" "firewall_policy_rule_collection_group" {
    name                = "BasicRuleCollectionGroups"
    firewall_policy_id = azurerm_firewall_policy.firewall_policy.id
    priority = 300
    network_rule_collection {
        name = "networkRuleCollection1"
        priority = 300
        action = "Allow"
        rule {
            name = "Allow-Any-Any"
            #rule_type = "NetworkRule"
            source_addresses = ["*"]
            destination_addresses = ["*"]
            destination_ports = ["*"]
            protocols = ["Any"]    
        }
    }
    
}

# Create Firewall
resource "azurerm_firewall" "azure_firewall" {
    name                = var.firewall_name
    location            = var.firewall_vnet_location
    resource_group_name = var.firewall_vnet_resource_group_name
    sku_name            = "AZFW_VNet"
    sku_tier            = "Standard"
    firewall_policy_id = azurerm_firewall_policy.firewall_policy.id

    ip_configuration {
        name                 = "internal-configuration"
        subnet_id            = var.firewall_vnet_subnet_id
        # public_ip_address_id = azurerm_public_ip.firewall_pip.id
    }
    tags = {
    owned_by = "Hashlama015"
  }
}

