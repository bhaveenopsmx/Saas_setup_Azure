variable client_secret {
    default = "S15n9-q_dt4Gnx6wwPf6DiERB_8xg~843J"
}

variable client_id {
    default = "1d9d2b54-4c04-429f-81f1-a96cb92a43ff"
}

variable location {
    description = "The bastion host location"
    default     = "East US"
}

variable virtual_network_name {
    description = "The name of the virtual network created by kubenet"
    default     = "aks-vnet-33614862"
}

variable resource_group_name {
    description = "Kube cluster node pool resource group name"
    default     = "MC_arjun-k8s-rg_arjun-kube-cluster_eastus"
}

variable bastion_subnet {
    description = "subnet for bastion host"
    default     = "10.250.0.0/27"
}

variable public_ip_allocation_method {
    description = "public ip allocation method for bastion"
    default     = "Static"  
}

variable public_ip_sku {
    description = "mention sku for public ip"
    default     = "Standard"
}

variable azure_bastion_service_name {
    description = "provide bastion service name"
    default     = "bastion-k8s"
}