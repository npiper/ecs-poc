#!/bin/bash

# Create cluster
aws ecs create-cluster

# Register task defintion
aws ecs register-task-definition --cli-input-json file://simple-app-task-def.json

# Create service - latest version of task family 'console-sample-app'
aws ecs create-service --service-name ecs-simple-service --task-definition console-sample-app --desired-count 1
