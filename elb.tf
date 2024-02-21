resource "aws_elb" "bar" {
name = "anilterraform-elb"
availability_zones = ["ap-south-1a","ap-south-1b"]

listner {
instance_port = 80
instance_protocol = "http"
lb_port = 80
lb_protocol = "http"
}

health_check {
healthy_threshold = 2
unhealthy_threshold = 2
timeout = 5
target  = "HTTP:80/"
interval = 30
}

instances = ["${aws_instanc.one.id}", "${aws_instance.two.id}"]
cross_zone_load_balancing = true
idle_timeout = 400
tags {
Name = "anil-tf-elb"
}
}

