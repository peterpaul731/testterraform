provider "azurerm" {
  version = "=2.95.0"
  features {}
}
data "azurerm_resource_group" "example" {
  name     = "newgrp1"
}
 
resource "azurerm_network_security_group" "example" {
  name                = "acceptanceTestSecurityGroup1"
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
}
 
 
resource "azurerm_network_security_rule" "example" {
 
  name                        = "test234"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80-443"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.example.name
  network_security_group_name = azurerm_network_security_group.example.name
}