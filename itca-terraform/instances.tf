# Get the latest Amazon Linux 2 AMI for the current region
data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.*-x86_64-gp2"]
  }
}

# Bastion host (public)
resource "aws_instance" "bastion" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public[0].id
  key_name      = var.key_name

  tags = {
    Name = var.bastion_name
  }
}

# CI/CD instance (private)
resource "aws_instance" "ci_cd" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private[0].id
  key_name      = var.key_name

  tags = {
    Name = var.ci_cd_name
  }
}

