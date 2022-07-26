resource "aws_kms_key" "aws-kms-s3-bucket-encrytpion" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "aws-s3-bucket-java-application" {
  bucket = "aws-s3-bucket-java-application"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "aws-s3-bucket-server-side-encryption" {
  bucket = aws_s3_bucket.aws-s3-bucket-java-application.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.aws-kms-s3-bucket-encrytpion.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_object" "java-jar-file" {
  bucket = aws_s3_bucket.aws-s3-bucket-java-application.id
  key    = "target/upskilling-8-SNAPSHOT.jar"
  source = "../target/upskilling-8-SNAPSHOT.jar"
}