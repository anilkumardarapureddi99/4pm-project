provider "aws" {
region = "ap-south-1"
access_key = "AKIAUV6C5FIWGAYLRMOH"
secret_key = "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"
}

resources "aws_instance" "one" {
ami = "ami-06b72b3b2a773be2b"
instance_type = "t2.medium"
key_name = "projectkeypair"
vpc_security_group_id = [aws_security_group.three.id]
availability_zone = "ap-south-1a"
user.data = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
checkconfig httpd on
echo "hai all this my website created  by terraform infrasture by anil server-1" > /var/WWW/html/index.html
EOF
tags = {
Name = "swiggy-01"
}
}

resources "aws_instance" "two" {
ami = "ami-0e670eb768a5fc3d4"
instance_type = "t2.medium"
key_name = "terrakeypair"
vpc_security_group_id = [aws_security_group.three.id]
availability_zone = "ap-south-1b"
user.data = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
checkconfig httpd on
echo "hai all this my website created  by terraform infrasture by anil server-2" > /var/WWW/html/index.html
EOF
tags = {
Name = "swiggy-02"
}
}

