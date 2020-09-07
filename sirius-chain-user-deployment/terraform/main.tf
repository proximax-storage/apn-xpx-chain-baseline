provider "aws" {
  version = "~> 2.45"
  region  = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = var.tf_state_bucket_name
    key            = var.tf_state_key_name
    region         = var.aws_region
  }
}

