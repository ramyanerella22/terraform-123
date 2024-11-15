provider "aws" {
region = "us-east-1"
}

resource "aws_instance" "one" {
count = 4
ami = "ami-0984f4b9e98be44bf"
instance_type = "t2.medium"
key_name = "hiii"
vpc_security_group_ids = ["sg-0aee0e9b3129cc3fe"]
tags = {
Name = var.instance_names[count.index]
}
}

variable "instance_names" {
  description = "List of instance names"
  type        = list(string)
  default     = ["jenkins", "nexus", "tomcat-1", "tomcat-2"]
}

