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
 * An ECS Container  based on ami 'amazon-ecs-optimized' (ami-862211e5)

## Getting Started

You will need an AWS account (Possible to get a yearly free trial) and create an IAM user who has 'AdministratorAccess' priveleges.

 * AWS Access key ID & Secret Access key
 * Default region (Australia default is ap-southeast-2 )

`aws configure`

## Setting up your environment with the scripts

Run the following sequence:
```
setupIdentities.sh
setupEC2.sh
```

A running instance will be created, it's ID will be on the command line

To get the public URL use this command

```
aws ec2 describe-instances --instance-ids $instanceId --query 'Reservations[0].Instances[0].PublicDnsName' --output text
```
### SSH'ing into the ECS Container VM

The above line prints out the public URL, now use this to ssh in as the `ec2-user`. You should be able to run normal `docker` commands.


```
ssh -i ./neil_keypair ec2-user@$instanceURL
```


## References

https://vaneyckt.io/posts/creating_an_ec2_instance_in_a_vpc_with_the_aws_cli/

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/get-set-up-for-amazon-ecs.html#create-an-iam-user

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/instance_IAM_role.html 

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html

http://docs.aws.amazon.com/AmazonECS/latest/developerguide/IAMPolicyExamples.html#first-run-permissions
