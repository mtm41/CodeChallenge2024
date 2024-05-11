# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.98.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "manu-data-rg"
    storage_account_name = "manuterraform123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "helm" {
  kubernetes {
    #config_path = "C:\\Users\\Manuel Torres\\.kube\\config"
    #config_path = "~/.kube/config"
    host                   = module.aks_cluster.kube_config_host
    client_certificate     = base64decode(module.aks_cluster.client_certificate)
    client_key             = base64decode(module.aks_cluster.client_key)
    cluster_ca_certificate = base64decode(module.aks_cluster.ca_certificate)

  }
}


provider "azurerm" {
  features {}
  use_oidc             = true

}

#data "terraform_remote_state" "foo" {
#  backend = "azurerm"
#  config = {
#    resource_group_name  = "manu-data-rg"
#    storage_account_name = "manuterraform123"
#    container_name       = "tfstate"
#    key                  = "terraform.tfstate"
#    use_oidc             = true

    #access_key           = var.storage_account_key  # Can also be set via `ARM_ACCESS_KEY` environment variable.
#  }
#}


module "network" {
    source = "./modules/vnet"
}

module "aks_cluster" {
    source = "./modules/aks"

    resource_group_name = var.resource_group_name
    location           = var.location
    cluster_name       = var.cluster_name
    node_count         = var.node_count
    vm_size            = var.vm_size
    os_disk_size_gb    = var.os_disk_size_gb
    node_pools         = var.node_pools
    tags               = var.tags
    dns_prefix         = var.dns_prefix
    subnet_ids         = module.network.subnet_id
}

module "aks_ingress" {
    source = "./modules/ingress-microsoft"

    depends_on = [ module.aks_cluster, module.network ]
}

/*module "metrics_server" {
  source = "./modules/metrics-server"

  depends_on = [ module.aks_cluster, module.network, module.aks_ingress ]
}*/