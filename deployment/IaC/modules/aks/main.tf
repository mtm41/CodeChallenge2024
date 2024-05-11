provider "azurerm" {
  features {}
}

resource  "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name

  default_node_pool {
    name            = "default"
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
    vnet_subnet_id = var.subnet_ids[0]
  }

  identity {
    type = "SystemAssigned"
  }
  dns_prefix = var.dns_prefix
  role_based_access_control_enabled = true
  oidc_issuer_enabled = true
  workload_identity_enabled = true

  # Enabling this option is recommended for most cases
  private_cluster_enabled = false
  sku_tier = "Free"

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "aks" {
  for_each = var.node_pools
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  name = each.value.name
  node_count = each.value.node_count 
  vm_size = each.value.vm_size 
  max_pods = 250
  os_disk_size_gb = each.value.os_disk_size_gb
  os_type = each.value.os_type 
  enable_auto_scaling = false
  vnet_subnet_id = var.subnet_ids[each.value.subnet_index]

  depends_on = [ azurerm_kubernetes_cluster.aks ]
}