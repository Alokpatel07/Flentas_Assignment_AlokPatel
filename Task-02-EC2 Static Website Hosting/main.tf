provider "aws" {
  region = "us-east-1"
}

# Create EC2 instance

resource "aws_instance" "alok_ec2" {
  ami                         = "ami-0fa3fe0fa7920f68e"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-0b6a2ee2ce544cfe8"
  key_name                    = "AlokPatelECServerKP"
  vpc_security_group_ids      = ["sg-051e0f7ffe21fbbd6"]
  associate_public_ip_address = true

  tags = {
    Name = "AlokPatelEC2Server"
  }
}
