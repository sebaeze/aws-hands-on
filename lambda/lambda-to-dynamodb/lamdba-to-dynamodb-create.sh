#! /bin/bash
#
pwd
aws dynamodb create-table --cli-input-json file://./lambda/lambda-to-dynamodb/create-table-users.json --region us-west-1
#