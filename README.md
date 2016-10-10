# Launcher for Creating an AWS ECS Environment

## Pre-requisites

The script creation is done using an AWS environment

You need to have a Docker registry account if you wish to create, push your own Docker images.

*This does not cover use of Amazon's ECR Docker Registry only Docker Hub*

## What is created?

 * A Group 'ECSAdmins' with the 'AdminstratorAccess' permission
 * The user 'neil' is allocated to this Group
 * An IAM role 'ecsInstanceRole' for managing Container instances & Services is created
 * An IAM role 'ecsServiceRole' for Container load balancing, scheduling is created
 * A new Policy for ECS based on permissions required from the 'Amazon ECS First Run Wizard' example ( AmazonECSFirstRunPolicy.json )
 * An ECS Container based on ami 'amazon-ecs-optimized' (ami-862211e5)


## References

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/get-set-up-for-amazon-ecs.html#create-an-iam-user

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/instance_IAM_role.html 

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/IAMPolicyExamples.html#first-run-permissions
