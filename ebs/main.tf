module "instance_creation" {
	source = "./modules/createIstance"
	ami_id = var.ami_id
	key_pair = var.key_pair
	instance_type = var.instance_type
}

module "ebs_creation" {
	source = "./modules/createEbs"
	instance_id = module.instance_creation.instance_id
}
