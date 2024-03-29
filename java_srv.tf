# Give location of the cloud-config file
data "template_file" "provision_java" {
template = file("scripts/add-java.yaml")  
}

#EC2 Instance

resource "aws_instance" "java_server" {
ami = "ami-02d63d6d135e3f0f0"
instance_type = "t2.micro"
# Use your own .pem key, located in this folder
key_name = "CloudBroWRCSI"
vpc_security_group_ids = [aws_security_group.java_server.id]
subnet_id              = aws_subnet.sch-public2.id
#Add dependency on RDS [aws_db_instance.schiele_db.id]
depends_on = [aws_internet_gateway.gw, aws_db_instance.schiele_db]
associate_public_ip_address = true
# Provision everything included in add-java.yaml using cloud-init
user_data = data.template_file.provision_java.rendered
root_block_device {
volume_type = "gp2"
volume_size = "8"
delete_on_termination = true
  }
# Fill these tags with your data
tags = {  
Name = "Schiele_Java"
Email = "csoti.istvan.ifj@gmail.com"
Comment = "Made with Terraform thru Github CI/CD..."
  }
}

resource "aws_eip" "java_server_eip" {
  instance = aws_instance.java_server.id
  vpc      = true
}
