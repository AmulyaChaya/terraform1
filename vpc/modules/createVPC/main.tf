resource "aws_vpc" "my-vpc" {
	cidr_block = var.cidr_block

	#optional
	enable_dns_support = "true" #gives you an internal domain name
	enable_dns_hostnames = "true" #gives you an internal host name
	enable_classiclink = "false"
	instance_tenancy = "default" 

	tags = {
		Name = "my-vpc"
	}
	
}