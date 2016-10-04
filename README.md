# Launcher for Creating an AWS ECS Environment

## Pre-requisites

The script creation is done using an AWS environment

## What is created?

 * A Group 'ECSAdmins' with the 'AdminstratorAccess' permission
 * The user 'neil' is allocated to this Group
 * An IAM role 'ecsInstanceRole' for managing Container instances & Services is created
 * An IAM role 'ecsServiceRole' for Container load balancing, scheduling is created



## References

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/get-set-up-for-amazon-ecs.html#create-an-iam-user

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/instance_IAM_role.html 
