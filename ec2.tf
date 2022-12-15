data "aws_ami" "latest_amz" {
  most_recent = true
  owners = ["137112412989"]
  filter {
    name = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
    }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_security_group" "ssh-sg" {
  name = "ssh-sg"
  description = "Allow SSH traffic via Terraform"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "my_profile" {
  name = "my_profile"
  role = aws_iam_role.sqs_role.name
}

resource "aws_instance" "my_instance" {
  ami                     = data.aws_ami.latest_amz.id
  instance_type           = "t2.micro"
  key_name                = "my_key"
  monitoring              = true
  vpc_security_group_ids  = [aws_security_group.ssh-sg.id]
  iam_instance_profile    = aws_iam_instance_profile.my_profile.name
  tags = {
    Name        = "EC2 Instance for SQS"
  }
}
