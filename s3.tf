resource "aws_s3_bucket" "bucket" {
  bucket = "bucket-iac-devops-learning-test"

  tags = {
    IAC = "True"
  }
}
