resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]
  location            = var.location  # Change the location to your desired region
  resource_group_name = azurerm_resource_group.vnetRg.name

  depends_on = [ azurerm_resource_group.vnetRg ]
}

resource "azurerm_subnet" "subnet" {
  count                   = length(var.subnet_cidrs)
  name                    = "subnet-${count.index}"
  resource_group_name     = azurerm_resource_group.vnetRg.name
  virtual_network_name    = azurerm_virtual_network.vnet.name
  address_prefixes        = var.subnet_cidrs[count.index]
}

resource "azurerm_resource_group" "vnetRg" {
  name     = "aks-vnet-rg"
  location = var.location  # Change to your desired region
}
