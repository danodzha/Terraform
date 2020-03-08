provider "aws" {
  access_key = ""
  secret_key = ""
  region     = "${var.aws_region}"
}


resource "random_id" "tf_bucket_id" {
  byte_length = 2
}

resource "aws_s3_bucket" "tf_code" {
  count = "${var.count_num}"
  bucket = "${var.project_name}-${random_id.tf_bucket_id.dec}${count.index}"
  acl    = "private"

  force_destroy = true

  tags = {
    Name = "tf_bucket"
  }
  versioning {
    enabled = true
  }
}

variable "count_num" {
}
variable "aws_region" {
  default = "us-east-1"
}
variable "project_name" {
  default = "terraform"
}
output "bucketname" {
  value = "${join(", ", aws_s3_bucket.tf_code.*.id)}"
}
