provider "aws" {
    access_key = var.AWS_ACCESS_KEY_ID
    secret_key = var.AWS_SECRET_ACCESS_KEY
    region = "us-east-1"
}

resource "aws_instance" "ec2_instance" {
    ami = "${var.ami_id}"
    count = "${var.number_of_instances}"
    subnet_id = "${var.subnet_id}"
    instance_type = "${var.instance_type}"
    key_name = "${var.ami_key_pair_name}"
}
resource "local_file" "hosts_cfg" {
    content = templatefile("./hosts.tpl",
     { 
       servers = aws_instance.ec2_instance.*.public_ip 
     }
    )
    filename = "../hosts.cfg"
}