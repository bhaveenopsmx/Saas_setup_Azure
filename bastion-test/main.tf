
provider "azurerm" {
   features {}
    version = "~>2.0"
    subscription_id = "959c83bf-0f16-4a56-a542-2067be19692e"
    client_id  = var.client_id
    client_secret = var.client_secret
    tenant_id = "d1ea7473-64d0-44ed-a093-ad8041071ee6"
}

data "azurerm_resource_group" "kuberg" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.kuberg.name
}

# Subnets Creation for Azure Bastion Service - at least /27 or larger.

resource "azurerm_subnet" "bastionsnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = data.azurerm_resource_group.kuberg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = [var.bastion_subnet]
}

# Public IP for Azure Bastion Service

resource "azurerm_public_ip" "bastionpip" {
  name                = "bastion-pip"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.kuberg.name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
}

# Azure Bastion Service host

resource "azurerm_bastion_host" "bastionhost" {
  name                = var.azure_bastion_service_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.kuberg.name

  ip_configuration {
    name                 = "${var.azure_bastion_service_name}-network"
    subnet_id            = azurerm_subnet.bastionsnet.id
    public_ip_address_id = azurerm_public_ip.bastionpip.id
  }
}