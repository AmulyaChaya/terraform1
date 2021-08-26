module "vpc-creation" {
	source = "./modules/createVPC"
	cidr_block = var.cidr_block
}

module "subnet-creation" {
	source = "./modules/createSubnet"
	subnet_cidr_block = var.subnet_cidr_block
	vcp_id = module.vpc-creation.vpc_id
	availability_zone = var.availability_zone
}


module "igw-creation" {
	source = "./modules/createIGW"
	vpc_id = module.vpc-creation.vpc_id
}

module "routing-table-creation" {
	source = "./modules/createRT"
	vpc_id = module.vpc-creation.vpc_id
	gateway_id = module.igw-creation.igw_id
	subnet_id = module.subnet-creation.subnet_id
}

resource "aws_instance" "my-instance" {
	ami = var.ami_id
	instance_type = var.instance_type
	key_name = var.key_pair
	subnet_id = module.subnet-creation.subnet_id
	#vpc_id = module.vpc-creation.vpc_id
	vpc_security_group_ids = ["${aws_security_group.sg.id}"]
	tags = {
		Name = "vpc"
	}

}

resource "aws_security_group" "sg" {
	name = "sg"
	description = "Allow ssh inbound traffic"
	vpc_id = module.vpc-creation.vpc_id
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}


