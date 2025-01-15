terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.49.0"
    }
  }
  backend "s3" {
    bucket = "terraform-state-b55b5d5e39becea593186ede9c5ae085"
    key    = "state/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}


resource "aws_s3_bucket" "terraform_state" {
  bucket        = "terraform-state-b55b5d5e39becea593186ede9c5ae085"
  force_destroy = true

  provider = aws

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    IAC = "True"
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
