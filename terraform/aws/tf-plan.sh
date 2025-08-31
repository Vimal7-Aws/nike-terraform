#!/usr/bin/env bash

echo "Checking for aws cli..."

if  [ -z "$(command -v aws)" ]; then
    echo 'Error: aws cli is not installed.'
    exit 1
fi

echo "EXECUTING: terraform init"
terraform init

echo "Executing: Terraform get"
terraform get


echo "EXECUTING: terraform plan"
terraform plan