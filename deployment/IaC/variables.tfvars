resource_group_name = "aks-test-rg"
location           = "North Central US"
cluster_name       = "manu-aks-dev"
node_count         = 1
vm_size            = "Standard_D2s_v5"
os_disk_size_gb    = 30

# Additional node pool(s)
node_pools = {
  pool1 = {
    name            = "pool1"
    node_count      = 2
    vm_size         = "Standard_D2s_v5"
    os_disk_size_gb = 30
    os_type         = "Linux"
    subnet_index    = 1
  }
}

tags = {
  environment = "test"
  project     = "manu-test-project"
}
