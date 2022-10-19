# aws-hands-on

## Description 
The purpose of this repo is to mantain several scripts in order to prepare for any AWS certification exam.

## Cloudformation

```bash
aws cloudformation deploy \
  --template ./cloudformation/ec2-httpd.yaml \
  --stack-name my-new-stack \
  --parameter-overrides ImageId=ami-026b57f3c383c2eec
```
