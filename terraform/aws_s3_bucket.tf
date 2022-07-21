resource "aws_kms_key" "aws-kms-java-project" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "aws-s3-bucket-java-project" {
  bucket = "aws-s3-bucket-java-project"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.aws-s3-bucket-java-project.bucket

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.aws-kms-java-project.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_object" "java-jar-file" {
  bucket = aws_s3_bucket.aws-s3-bucket-java-project.id
  key    = "target/upskilling-0.0.1-SNAPSHOT.jar"
  source = "../target/upskilling-0.0.1-SNAPSHOT.jar"
}