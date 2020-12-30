output "kube_config" {
  value = azurerm_kubernetes_cluster.privateaks.kube_config_raw
}

#output "client_certificate" {
#  value = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
#}

output "node_resource_group_name" {
  value = azurerm_kubernetes_cluster.privateaks.node_resource_group
}

output "k8clustername" {
    value = azurerm_kubernetes_cluster.privateaks.name
}
