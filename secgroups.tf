#Web server security group
resource "aws_security_group" "generic_server" { # Use your own security group name instead of 'wp-server', refer to this in wp-server.tf
name = "generic-server"
description = "Allow HTTP, HTTPS, webhook and SSH traffic"
vpc_id      = aws_vpc.schiele.id

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
from_port = 9000
to_port = 9000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
  }
}

#Java application server security group

resource "aws_security_group" "java_server" { # Use your own security group name instead of 'wp-server', refer to this in wp-server.tf
name = "java-server"
description = "Allow HTTP, HTTPS, webhook, and SSH traffic"
vpc_id      = aws_vpc.schiele.id

ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

# ingress {
# from_port = 443
# to_port = 443
# protocol = "tcp"
# cidr_blocks = ["0.0.0.0/0"]
#   }

ingress {
from_port = 9000
to_port = 9000
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
  }
}

#RDS security group

resource "aws_security_group" "postgres_server" { # Use your own security group name instead of 'wp-server', refer to this in wp-server.tf
name = "postgres-server"
description = "Allow HTTP and SSH traffic"
vpc_id      = aws_vpc.schiele.id

ingress {
from_port = 5432
to_port = 5432
protocol = "tcp"
security_groups = [aws_security_group.java_server.id]
  }

ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
  }

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
  }
}