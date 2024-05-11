variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
  default     = "aks-vnet"
}

variable "vnet_address_space" {
  description = "Address space of the Virtual Network"
  type        = string
  default     = "172.16.0.0/16"
}

variable "subnet_cidrs" {
  description = "List of subnet address ranges"
  type        = list(list(string))
  default     = [["172.16.1.0/24"], ["172.16.2.0/24"]]
}

variable "location" {
  description = "Azure region for the AKS cluster"
  type        = string
  default     = "North Central US"
}