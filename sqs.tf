resource "aws_sqs_queue" "my_queue" {
  name                        = "terraform-test-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
  tags = {
    Environment = "test"
  }
}
