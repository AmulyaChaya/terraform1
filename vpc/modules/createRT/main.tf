resource "aws_route_table" "pub-route-table" {
	vpc_id = var.vpc_id 
	route {
		cidr_block = "0.0.0.0/0" # associate subnet can reach anywhere
		gateway_id = var.gateway_id
	}
	tags = {
		Name = "public-table"
	}
}

resource "aws_route_table_association" "attaching-subnet-routing-table" {
	subnet_id = var.subnet_id
	route_table_id = "${aws_route_table.pub-route-table.id}"
}