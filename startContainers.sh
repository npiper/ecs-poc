#!/bin/bash

# Register task defintion
aws ecs register-task-definition --cli-input-json file://simple-app-task-def.json
