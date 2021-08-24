terraform "s3" {
	backend {
		bucket = "${bucket_name}"
		key = "${key}"
		region = "${region}"
		dynamodb_table = "${dynamo_table}"
		encrypt = true	
	}
}
