# aws-hands-on

## Purpose 

The purpose of this repo is to mantain several scripts that helps in the preparation to any AWS certification exam.

## Cloudformation

```bash
aws cloudformation deploy \
  --template ./cloudformation/ec2-httpd.yaml \
  --stack-name my-new-stack \
  --parameter-overrides ImageId=ami-026b57f3c383c2eec
```

## SQS

```
aws sqs list-queues
aws sqs get-queue-attributes --queue-url=https://sqs.${AWS_REGION_ID}.amazonaws.com/${ACCOUNT_ID}/${QUEUE_NAME}  --attribute-names All
```