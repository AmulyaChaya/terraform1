module "s3_creation" {
	source = "./modules/createS3"
	bucket_name = var.bucketname
}

module "dynamoDB_creation" {
	source = "./modules/createDynamoDB"
	dynamdb_name = var.dynamoname
	hash_key = var.hash_key
}

resource "aws_instance" "my_instance" {
	ami = var.ami-id
	instance_type = var.instance-type
	tags = {
		Name = "terra-taints"
	}
}

data "template_file" "backend" {
	template = "${file("templates/backend.tpl")}"
	vars = {
		bucket_name = var.bucketname
		key = "backend/terraform.tfstate"
		region = var.aws_region
		dynamo_table = var.dynamoname
	}
}

