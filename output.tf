output "inst-pub-ip" {
	value = aws_instance.my_instance.public_ip
}

output "inst-priv-ip" {
	value = aws_instance.my_instance.private_ip
}