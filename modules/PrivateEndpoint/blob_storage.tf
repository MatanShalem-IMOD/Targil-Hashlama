
# # Step 5: Create a private endpoint
# resource "azurerm_private_endpoint" "example" {
#   name                = "example-private-endpoint"
#   location            = "West Europe"
#   resource_group_name = "hashlama015-encryption-rg"
#   subnet_id           = var.encryption_subnet_id

#   private_service_connection {
#     name                           = "example-privatelink"
#     private_connection_resource_id = var.storage_account_id
#     is_manual_connection           = false
#     subresource_names              = ["blob"] # Subresource names can be 'blob', 'file', 'table', 'queue'
#   }
# }

# # Step 6: Create a private DNS zone for blob
# resource "azurerm_private_dns_zone" "example" {
#   name                = "privatelink.blob.core.windows.net"
#   resource_group_name = "hashlama015-encryption-rg"
# }

# # Step 7: Create a DNS link between the virtual network and private DNS zone
# resource "azurerm_private_dns_zone_virtual_network_link" "example" {
#   name                  = "example-link"
#   resource_group_name   = "hashlama015-encryption-rg"
#   private_dns_zone_name = azurerm_private_dns_zone.example.name
#   virtual_network_id    = var.encryption_vnet_id
# }

# # Step 8: Register the DNS A record for the private endpoint
# resource "azurerm_private_dns_a_record" "example" {
#   name                = "example-private-dns-a-record"
#   zone_name           = azurerm_private_dns_zone.example.name
#   resource_group_name = "hashlama015-encryption-rg"
#   ttl                 = 300
#   records             = [azurerm_private_endpoint.example.private_service_connection[0].private_ip_address]
# }