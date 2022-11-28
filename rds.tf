resource "aws_db_instance" "schiele_db" {
  storage_type = "gp2"
  allocated_storage    = 20
#  max_allocated_storage = 100
  db_name              = "schiele"
  engine               = "postgres"
  engine_version       = "13.7"
  instance_class       = "db.t3.micro"
  availability_zone    = "eu-central-1c"
  username             = "dbadmin"
  password             = "verysafepassword"
  skip_final_snapshot  = true
#  apply_immediately   = true
#  enabled_cloudwatch_logs_exports = "postgresql"
  vpc_security_group_ids = [aws_security_group.postgres_server.id]
}