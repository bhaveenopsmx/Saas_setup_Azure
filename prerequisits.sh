#!/bin/bash


#Azure-cli installation
sudo apt update
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash


#create ssh key for bastion connection
ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa


#Kubectl installation
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
kubectl version --client


#Terraform installation
sudo wget https://releases.hashicorp.com/terraform/0.14.1/terraform_0.14.1_linux_amd64.zip
sudo unzip terraform_0.14.1_linux_amd64.zip
sudo mv terraform /usr/local/bin/

#helm 3 installation
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


#git installation
sudo apt install git -y

#jq installation
sudo apt install jq -y
 

echo "azure-cli version is $(az --version) \n"
echo "Kubectl version is $(kubectl version --client --short) \n"
echo "terraform version is $(terraform -v) \n"

