resource "aws_instance" "my_instance" {
	ami = var.ami-id
	instance_type = var.instance-type
	tags = {
		Name = "Terra-instance"
	}
}
