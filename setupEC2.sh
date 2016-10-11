#!/bin/bash

# Reference - https://vaneyckt.io/posts/creating_an_ec2_instance_in_a_vpc_with_the_aws_cli/

# Create a dedicated VPC - up to 16 IP addresses
vpcId=`aws ec2 create-vpc --cidr-block 10.0.0.0/28 --query 'Vpc.VpcId' --output text`

# overwrite the default VPC DNS settings - enable dns support & hostnames

# Create a dedicated internet gateway
aws ec2 modify-vpc-attribute --vpc-id $vpcId --enable-dns-support "{\"Value\":true}"

aws ec2 modify-vpc-attribute --vpc-id $vpcId --enable-dns-hostnames "{\"Value\":true}"

# Add an internet Gateway and attach it to our new VPC
internetGatewayId=`aws ec2 create-internet-gateway --query 'InternetGateway.InternetGatewayId' --output text`
aws ec2 attach-internet-gateway --internet-gateway-id $internetGatewayId --vpc-id $vpcId

# Create a subnet for the VPC (One)
subnetId=`aws ec2 create-subnet --vpc-id $vpcId --cidr-block 10.0.0.0/28 --query 'Subnet.SubnetId' --output text`


# Routing table for Subnet (how to route outbound traffic)
routeTableId=`aws ec2 create-route-table --vpc-id $vpcId --query 'RouteTable.RouteTableId' --output text`
aws ec2 associate-route-table --route-table-id $routeTableId --subnet-id $subnetId
aws ec2 create-route --route-table-id $routeTableId --destination-cidr-block 0.0.0.0/0 --gateway-id $internetGatewayId

# Add a Security group
securityGroupId=`aws ec2 create-security-group --group-name my-security-group --description "my-security-group" --vpc-id $vpcId --query 'GroupId' --output text`
aws ec2 authorize-security-group-ingress --group-id $securityGroupId --protocol tcp --port 22 --cidr 0.0.0.0/0

# Assumption secuirty key neil-ecs created
