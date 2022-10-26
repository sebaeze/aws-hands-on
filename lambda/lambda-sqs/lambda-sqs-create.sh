#! /bin/bash
#
AWS_REGION="us-east-1"
#
aws sqs create-queue --queue-name queue-lambda-std --region ${AWS_REGION}
#