resource "aws_db_subnet_group" "main" {
  name       = "${var.env_name}-db-subnet-group"
  subnet_ids = aws_subnet.private[*].id

  tags = {
    Name = "${var.env_name}-db-subnet-group"
  }
}

resource "aws_db_instance" "main" {
  allocated_storage     = 20
  engine                = "mysql"
  engine_version        = "8.0"
  instance_class        = "db.t3.micro"
  name                  = "itca_db"
  username              = var.db_username
  password              = var.db_password
  skip_final_snapshot   = true
  publicly_accessible   = false
  vpc_security_group_ids = [aws_security_group.ci_cd_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.main.name

  tags = {
    Name = "${var.env_name}-rds"
  }
}
