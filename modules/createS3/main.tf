resource "aws_s3_bucket" "remote_state_s3" {
    bucket = var.bucket_name
	
	#Enable versioning for state file
	versioning {
		enabled = true 
	}
	
	#Enable Server side encryption (SSE)
	server_side_encryption_configuration {
		rule {
			apply_server_side_encryption_by_default {
				sse_algorithm = "AES256"
			}
		}
	}
	
	# Prevent from acidental destroy
	lifecycle {
		prevent_destroy = true
	}
}
