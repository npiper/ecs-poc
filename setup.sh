#!/bin/bash

# Reference:

# 1) Create an ECS Group 'ECSAdmins' via iam

aws iam create-group --group-name ECSAdmins

# 2) Attach the AdministratorAccess policy to the group
aws iam attach-group-policy --group-name ECSAdmins --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

# 3) Add user to group
aws iam add-user-to-group --group-name ECSAdmins --user-name neil

# 4) Create the 'ecsInstanceRole' for Amazon ECS Container Agent
aws iam create-role --role-name ecsInstanceRole --assume-role-policy-document file://ecsInstanceRole_Policy.json

# 5) Attach the policy 'AmazonEC2ContainerServiceforEC2Role' to 'ecsInstanceRole'
aws iam attach-role-policy --role-name ecsInstanceRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role

# 6) Create the 'ecsServiceRole' for managing container instances / loadbalancing
aws iam create-role --role-name ecsServiceRole --assume-role-policy-document file://ecsInstanceRole_Policy.json

# 7) Attach the policy 'AmazonEC2ContainerServiceRole' to ecsServiceRole
aws iam attach-role-policy --role-name ecsServiceRole --policy-arn arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole 
