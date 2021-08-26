resource "aws_subnet" "my-subnet" {
	cidr_block = var.subnet_cidr_block
	vpc_id = var.vcp_id
	map_public_ip_on_launch = true #this is important while creating public subnet 
	availability_zone = var.availability_zone
	
	tags = {
		Name = "pub_subnet"
	}
	
}