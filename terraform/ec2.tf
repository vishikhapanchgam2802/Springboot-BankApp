
#key pair(login)
resource aws_key_pair my_key{
    key_name = "bankapp-automate-key"
    public_key = file("bankapp-automate-key.pub")
}

#VPC and Security Group 
resource aws_default_vpc default{

}

resource aws_security_group my_security_group {
  name = "automate-sg"
  description = "This will add a TF generated security group"
  vpc_id = aws_default_vpc.default.id


#inboude rules
ingress {
    from_port=22
    to_port=22
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
    description="SSH Open"
}

ingress {
    from_port=8000
    to_port=8000
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
    description="App Open"
}


ingress {
    from_port=80
    to_port=80
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
    description="HTTP Open"
}

ingress {
    from_port=443
    to_port=443
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
    description="HTTPS Open"
}
#outbound rules

egress{
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description="all access open outbound"
}
}
#ec2 instance
resource "aws_instance" "my_instance" {
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type= var.instance_type
    ami=var.ami_id
    tags = {
        Name = "Bankapp-Automation-Server"
    }


root_block_device {
  volume_size=29
  volume_type = "gp3"
}

 
}