provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-012967cc5a8c9f891"
instance_type = "t2.micro"
key_name = "hiii"
vpc_security_group_ids = ["sg-0aee0e9b3129cc3fe"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
default = ["jenkins", "nexus", "tomcat-1", "tomcat-2"]
}
