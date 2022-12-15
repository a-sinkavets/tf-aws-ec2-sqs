This is test repository for task of creation ec2 instance which will be able to send messages to created SQS queue

## Prerequisites
- AWS account ( Access and Secret keys )
- Fill `variables.tf` file with AWS cli credentials
- AWS RSA key named "my_key" created before
  ( could be import from locals public RSA key by TF resource - **resource "aws_key_pair" "my_key"** )

## How to use
You will find two outputs in Terraform
1) Ec2 instance public IP, so you could login to it by `ssh -i [path/to/key.pem] -l ec2-user [EC2-PUBLIC-IP]`
2) Command you could run to send message from EC2 instance to SQS, i.e `aws sqs send-message --region us-east-1 --endpoint-url https://sqs.us-east-1.amazonaws.com/ --queue-url https://sqs.us-east-1.amazonaws.com/[account-nr]/terraform-test-queue.fifo --message-body "Hello from Amazon SQS" --message-group-id test`
