resource "aws_ebs_volume" "ebs_volume" {

	availability_zone = var.zone
	size = var.ebs_size
	tags = {
		Name = "new-volume"
	}
}

resource "aws_volume_attachment" "ebs-attach" {
	device_name = var.device-name
	volume_id = aws_ebs_volume.ebs_volume.id
	instance_id = var.instance_id
}
