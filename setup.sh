#!/bin/bash

# Reference:

# 1) Create an ECS Group 'ECSAdmins' via iam

aws iam create-group --group-name ECSAdmins

# 2) Attach the AdministratorAccess policy to the group
aws iam attach-group-policy --group-name ECSAdmins --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

# 3)     
