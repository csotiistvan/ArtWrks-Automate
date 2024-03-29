# Give location of the cloud-config file

data "template_file" "provision_apache_2" {
template = file("scripts/add-docked-apache-2.yaml")  
}

#EC2 Instance
# Use your own server name instead of 'prime_server'

resource "aws_instance" "web_server" {
ami = "ami-02d63d6d135e3f0f0"
instance_type = "t2.micro"
# Use your own .pem key, located in this folder
key_name = "CloudBroWRCSI"
vpc_security_group_ids = [aws_security_group.generic_server.id]
subnet_id              = aws_subnet.sch-public1.id
depends_on = [aws_internet_gateway.gw]
associate_public_ip_address = true
# Provision everything included in add-nginx.yaml using cloud-init
# user_data = data.template_file.provision_nginx.rendered
user_data = data.template_file.provision_apache_2.rendered
root_block_device {
volume_type = "gp2"
volume_size = "8"
delete_on_termination = true
  }
# Fill these tags with your data
tags = {  
Name = "Schiele_Docked_Apache"
Email = "csoti.istvan.ifj@gmail.com"
Comment = "Made with Terraform thru Github CI/CD"
  }
}

#EC2 Instance

# resource "aws_instance" "sec_server" {
# ami = "ami-02d63d6d135e3f0f0"
# instance_type = "t2.micro"
# # Use your own .pem key, located in this folder
# key_name = "CloudBroWRCSI"
# vpc_security_group_ids = [aws_security_group.generic_server.id]
# subnet_id              = aws_subnet.sch-public2.id
# depends_on = [aws_internet_gateway.gw]
# associate_public_ip_address = true
# # Provision everything included in add-docked-ngx.yaml using cloud-init
# user_data = data.template_file.provision_apache_2.rendered
# root_block_device {
# volume_type = "gp2"
# volume_size = "8"
# delete_on_termination = true
#   }
# # Fill these tags with your data
# tags = {  
# Name = "Schiele_Docked_Apache_2"
# Email = "csoti.istvan.ifj@gmail.com"
# Comment = "Made with Terraform thru Github CI/CD"
#   }
# }

resource "aws_eip" "web_server_eip" {
  instance = aws_instance.web_server.id
  vpc      = true
}