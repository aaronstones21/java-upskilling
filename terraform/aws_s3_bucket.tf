resource "aws_kms_key" "mykey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "mybucket-v2" {
  bucket = "mybucket-v2"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.mybucket-v2.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_object" "java-jar-file" {
  bucket = aws_s3_bucket.mybucket-v2.id
  key    = "target/upskilling-0.0.1-SNAPSHOT.jar"
  source = "../target/upskilling-0.0.1-SNAPSHOT.jar"
}