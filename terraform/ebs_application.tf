resource "aws_elastic_beanstalk_application" "ebs-app" {
  name = var.JUR_VERSION
  description = "This is a live java upskilling project."
  appversion_lifecycle {
    service_role = var.AWS_IAM_USER
    max_count = 128
    delete_source_from_s3 = false
  }
}
