#!/bin/bash

aws iam detach-group-policy --group-name ECSAdmins --policy-arn arn:aws:iam::aws:policy/AdministratorAccess

aws iam delete-group --group-name ECSAdmins
