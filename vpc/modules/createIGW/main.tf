resource "aws_internet_gateway" "my-gateway" {
	vpc_id = var.vpc_id 
	tags = {
		Name = "IGW"
	}
}