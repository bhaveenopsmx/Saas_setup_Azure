variable client_secret {
    default = "S15n9-q_dt4Gnx6wwPf6DiERB_8xg~843J"
}

variable client_id {
    default = "1d9d2b54-4c04-429f-81f1-a96cb92a43ff"
}

variable location {
    description = "The kubernetes cluster location"
    default     = "East US"
}

variable resource_group_name {
    description = "Kube cluster resource group name"
    default     = "arjun-k8s-rg"
}

variable kube_cluster_name {
    description = "Kube cluster name"
    default     = "arjun-kube-cluster"  
}

variable kube_version {
    description = "k8s version required"
    default     = "1.18.10"
}

variable dns_prefix {
    description = "Define dns prefix name"
    default     = "arjun-dns-prefix"
}  

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable nodepool_nodes_count {
    description = "set the node count"
    default     = 1
}

variable nodepool_vm_size {
    description = "desired nodepool vm size"
    default     = "Standard_D8s_v3"
}

