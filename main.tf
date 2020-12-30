provider "azurerm" {
   features {}
    version = "~>2.0"
    subscription_id = "959c83bf-0f16-4a56-a542-2067be19692e"
    client_id  = var.client_id
    client_secret = var.client_secret
    tenant_id = "d1ea7473-64d0-44ed-a093-ad8041071ee6"
}

resource "azurerm_resource_group" "kuberg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "privateaks" {
  name                    = var.kube_cluster_name
  location                = var.location
  kubernetes_version      = var.kube_version
  resource_group_name     = azurerm_resource_group.kuberg.name
  dns_prefix              = var.dns_prefix
  private_cluster_enabled = false

  linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = file(var.ssh_public_key)
        }
  }
  
  default_node_pool {
    name           = "default"
    node_count     = var.nodepool_nodes_count
    vm_size        = var.nodepool_vm_size
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  role_based_access_control {
    enabled = true
  }

  network_profile {
    network_plugin  = "kubenet"
  }

  tags = {
    Environment = "Customer Demo"
  }
}  
