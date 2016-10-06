#!/bin/bash

# Detatch role policies
aws iam detach-role-policy --role-name ecsInstanceRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role 

aws iam detach-role-policy --role-name ecsServiceRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole 


# Delete role ecsInstanceRole
aws iam delete-role --role-name ecsInstanceRole
aws iam delete-role --role-name ecsServiceRole


# Remove users from ECSAdmins
aws iam remove-user-from-group --group-name ECSAdmins --user-name neil

# Detatch Policy from ECSAdmins
aws iam detach-group-policy --group-name ECSAdmins --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

# Remove group ECSAdmins
aws iam delete-group --group-name ECSAdmins

# Delete generated keypair
rm neil_keypai*
