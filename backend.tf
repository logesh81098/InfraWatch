terraform {
  backend "s3" {
    bucket = "terraform-backend-files-logesh"
    key    = "infrawatch"
    region = "us-east-1"
  }
}