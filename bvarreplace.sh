#!/bin/bash

./getvnetdetails.sh
cd bastion-test
terraform apply -auto-approve 
