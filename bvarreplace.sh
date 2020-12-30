#!/bin/bash

sh ./getvnetdetails.sh
cd bastion-test
terraform apply -auto-approve 