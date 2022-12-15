output "ec2_instance_ip" {
  description = "EC2 Instance public IP"
  value = aws_instance.my_instance.public_ip
}

output "test_sqs_query" {
  description = "You could send message from EC2 instance to SQS queue by next command"
  value = "aws sqs send-message --region ${var.region} --endpoint-url https://sqs.${var.region}.amazonaws.com/ --queue-url ${aws_sqs_queue.my_queue.url} --message-body 'Hello from Amazon SQS' --message-group-id test"
}
