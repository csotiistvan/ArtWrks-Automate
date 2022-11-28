# Give location of the cloud-config file
data "template_file" "provision_apache" {
template = file("scripts/add-apache.yaml")  
}

#EC2 Instance

resource "aws_instance" "sec_server" {
ami = "ami-02d63d6d135e3f0f0"
instance_type = "t2.micro"
# Use your own .pem key, located in this folder
key_name = "CloudBroWRCSI"
vpc_security_group_ids = [aws_security_group.generic_server.id]
subnet_id              = aws_subnet.sch-public.id
associate_public_ip_address = true
# Provision everything included in add-nginx.yaml using cloud-init
user_data = data.template_file.provision_apache.rendered
root_block_device {
volume_type = "gp2"
volume_size = "8"
delete_on_termination = true
  }
# Fill these tags with your data
tags = {  
Name = "Schiele_Apache"
Email = "csoti.istvan.ifj@gmail.com"
Comment = "Made with Terraform thru Github CI/CD"
  }
}
