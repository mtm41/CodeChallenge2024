variable "resource_group_name" {
  description = "The name of the Azure Resource Group where AKS will be deployed."
}

variable "location" {
  description = "The Azure region where AKS will be deployed."
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
}

variable "node_count" {
  description = "The number of nodes in the default node pool."
}

variable "vm_size" {
  description = "The VM size for nodes in the default node pool."
}

variable "os_disk_size_gb" {
  description = "The OS disk size (in GB) for nodes in the default node pool."
}

variable "dns_prefix" {
  default = "origentestaks"
}

variable "node_pools" {
  description = "A map of additional node pools for the AKS cluster."
  type        = map(object({
    name            = string
    node_count      = number
    vm_size         = string
    os_disk_size_gb = number
    os_type         = string
    subnet_index    = number
  }))
}

variable "tags" {
  description = "A map of tags to apply to all Azure resources."
  type        = map(string)
}


variable "subnet_ids" {
  description = "List of subnet IDs from the first module"
  type        = list(string)
}
