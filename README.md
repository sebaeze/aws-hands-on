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

### Access Policy that allows s3 event notifications to SQS

```json
{
  "Version": "2012-10-17",
  "Id": "example-ID",
  "Statement": [
    {
      "Sid": "example-statement-ID",
      "Effect": "Allow",
      "Principal": {
        "AWS": "*"
      },
      "Action": "SQS:SendMessage",
      "Resource": "arn:aws:sqs:${AWS_REGION_ID}:${ACCOUNT_ID}:${QUEUE_NAME}",
      "Condition": {
        "StringEquals": {
          "aws:SourceAccount": "${ACCOUNT_ID}"
        },
        "ArnLike": {
          "aws:SourceArn": "arn:aws:s3:::${BUCKET_NAME}"
        }
      }
    }
  ]
}
```

## S3

```
aws s3 ls
```

## lambda

### Cli
```bash
aws lambda list-functions
aws lambda get-function --function-name=my-function
aws lambda invoke --function-name=my-function --cli-binary-format raw-in-base64-out --payload='{"key1":"ssss","key2":"dos","key3":"tresss"}' temp.json
```