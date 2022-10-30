# aws-hands-on

## Purpose 

The purpose of this repo is to mantain several scripts that helps in the preparation to any AWS certification exam.

## Cloudformation

### EC2
```bash
aws cloudformation deploy \
  --template ./cloudformation/ec2-httpd.yaml \
  --stack-name my-new-stack \
  --parameter-overrides ImageId=ami-026b57f3c383c2eec
```

### DynamoDB
```bash
aws cloudformation deploy --template ./cloudformation/dynamoDB.yaml --stack-name my-db-nosql \
                          --parameter-overrides HashKeyElementName=ID HashKeyElementType=S
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

### Create function
```bash
pushd lambda && zip my-function.zip index.js && popd
aws iam delete-role --role-name my-function-role 
aws iam create-role --role-name my-function-role --assume-role-policy-document file://lambda/my-function-role-policy.json > lambda/temp-new-role.json
aws iam attach-role-policy --role-name my-function-role --policy-arn arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole

aws lambda create-function --function-name my-function --zip-file fileb://lambda/my-function.zip --handler index.handler --runtime nodejs14.x --role $(cat lambda/temp-new-role.json | egrep 'Arn' | cut -c17-63) --region=us-east-1

aws lambda list-functions

```

### Test function
```bash
aws lambda list-functions
aws lambda get-function --function-name=my-function
aws lambda invoke --function-name=my-function --cli-binary-format raw-in-base64-out --payload='{"key1":"ssss","key2":"dos","key3":"tresss"}' temp.json &&  cat temp.json
```

## Step Functions

```bash
aws iam delete-role --role-name stepfunctions-role-hello-world 
aws iam create-role --role-name stepfunctions-role-hello-world --assume-role-policy-document file://stepfunctions/01_role_hello_world.json > stepfunctions/temp-new-role.json


aws stepfunctions create-state-machine --name step-function-hello-world --role $(cat stepfunctions/temp-new-role.json | egrep 'Arn' | cut -c17-63)  --definition file://./stepFunctions/01_helloWorld.json

```