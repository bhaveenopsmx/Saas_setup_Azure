#!/bin/bash

#sh ./prerequisits.sh
#terraform plan -refresh=true
terraform apply -auto-approve 
./bvarreplace.sh
