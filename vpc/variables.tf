variable "cidr_block" {
	default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
	default = "10.0.1.0/24"
}

variable "availability_zone" {
	default = "us-east-1a"
}

variable "ami_id" {
	default = "ami-09e67e426f25ce0d7"
}

variable "key_pair" {
	default = "terraform"
}

variable "instance_type" {
	default = "t2.micro"
}