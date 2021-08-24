variable "instance-type" {
	type = string
	default = "t2.micro"
}

variable "ami-id" {
	type = string 
	default = "ami-00399ec92321828f5"
}

variable "bucketname" {
	type = string
	default = "s3-test-backend-bucket-ammu"
}

variable "dynamoname" {
	type = string
	default = "backend_dynamoDB"
}

variable "aws_region" {
	type = string
	default = "us-east-1"
}

variable "hash_key" {
	type = string
	default = "LockID"
}