data "aws_iam_policy" "sqs_role_policy" {
  name = "AmazonSQSFullAccess"
}

resource "aws_iam_role" "sqs_role" {
  name = "my_sqs_ec2_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "ec2-sqs-example"
  }
  managed_policy_arns = [data.aws_iam_policy.sqs_role_policy.arn]
}
