terraform {
   required_version = "=1.0.4"


   required_providers {
		aws = {
		  version = "=3.55.0"
		  source = "hashicorp/aws"

		}
	}
	
	backend "s3" {
		bucket = "s3-test-backend-bucket-ammu"
		key = "backend/terraform.tfstate"
		region = "us-east-2"
		dynamodb_table = "backend_dynamoDB"
		encrypt = true
    }
}
