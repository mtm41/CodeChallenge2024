variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "my-aks-rg"
}

variable "location" {
  description = "Azure region for the AKS cluster"
  type        = string
  default     = "West Europe"
}

variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "manu-aks-dev"
}


variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
  default     = 1
}

variable "vm_size" {
  description = "VM size for the default node pool"
  type        = string
  default     = "Standard_D2s_v5"
}

variable "storage_account_key" {
  description = "storage account key to save the state"
  type        = string
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB for the default node pool"
  type        = number
  default     = 30
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

variable "dns_prefix" {
  default = "manutesttasks"
}

variable "tags" {
  description = "Tags to apply to the AKS cluster"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "test-project"
  }
}