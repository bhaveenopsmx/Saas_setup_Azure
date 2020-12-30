#!/bin/bash

cd bastion-test
terraform destroy -auto-approve
cd ..
terraform destroy -auto-approve

