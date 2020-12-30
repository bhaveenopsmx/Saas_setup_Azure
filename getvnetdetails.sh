#!/bin/bash

nodergname=$(terraform output -json node_resource_group_name)
nodename=$(sed -e 's/^"//' -e 's/"$//' <<<"$nodergname")
vnetname=$(az network vnet list -g $nodename | jq -r '.[0].name')
vnetaddress=$(az network vnet list -g $nodename | jq -r '.[0].addressSpace.addressPrefixes[0]')
pvtclustersubnet=$(az network vnet list -g $nodename | jq -r '.[0].subnets[0].addressPrefix')
echo "node resource group name is $nodename"
echo "vnet name is $vnetname" 
echo "vnet address is $vnetaddress"
echo "vnet cluster private subnet is $pvtclustersubnet"
sed -i 's/VNETNAME/'$vnetname'/g' bastion-test/variables.tf
sed -i 's/NODEPOOLRG/'$nodename'/g' bastion-test/variables.tf