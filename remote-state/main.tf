resource "aws_s3_bucket" "s3backend" {
  bucket = "s3-3s-my-project-backend"

  versioning = {
    enabled = true
  }

  force_destroy = true
}
