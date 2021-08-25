resource "aws_instance" "instance1" {

	ami = var.ami_id
	instance_type = var.instance_type
	key_name = var.key_pair
	availability_zone = "us-east-1a"
	tags = {
		Name = "ebs"
	}
}

