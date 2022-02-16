provider "azurerm" {
  version = "=2.95.0"
  subscription_id = "d5b3f059-9021-498a-85b1-88fe5ed0a6e7"
  client_id       = "c10e96c0-4387-4ba5-bfde-f954da605882"
  client_secret   = "lrZlQUVuM-e~Eu2xGeDZhhkqUpxIR73n.-"
  tenant_id       = "9f6dfea8-7e92-4eb9-86d6-b6b967ecc2a2"
}
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