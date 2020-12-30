output "azure_bastion_subnet_id" {
  description = "The resource ID of Azure bastion subnet"
  value       = azurerm_subnet.bastionsnet.id
}

output "azure_bastion_public_ip" {
  description = "The public IP of the virtual network gateway"
  value       = azurerm_public_ip.bastionpip.ip_address
}

output "bastion_host_name" {
   description = "bastion-host name"
   value       = azurerm_bastion_host.bastionhost.name
}

