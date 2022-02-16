data "azurerm_resource_group" "example" {
  name     = "newgrp1"
}
 
resource "azurerm_network_security_group" "testgrp" {
  name                = "acceptanceTestSecurityGroup2"
  location            = $(data.azurerm_resource_group.example.location)
  resource_group_name = $(data.azurerm_resource_group.example.name)
}
 
resource "azurerm_network_security_rule" "testgrp" {
  name                        = "testgrp-out"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = $(data.azurerm_resource_group.example.name)
  network_security_group_name = azurerm_network_security_group.testgrp.name
}