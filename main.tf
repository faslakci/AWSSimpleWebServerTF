provider "aws" {
  region = "us-east-1" # Set your desired AWS region
}

# EC2 Instance
resource "aws_instance" "web_server" {
  ami           = "ami-xxxxxxxxxxxxxxxxx" # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  key_name      = "your-key-pair-name"    # Set your key pair name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<html><body><h1>Hello, Terraform!</h1></body></html>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "web-server-instance"
  }
}