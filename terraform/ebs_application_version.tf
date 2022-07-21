resource "aws_elastic_beanstalk_application_version" "ebs-app-ver" {
  depends_on = [aws_elastic_beanstalk_application.ebs-app]
  application = "${aws_elastic_beanstalk_application.ebs-app.name}"
  bucket = aws_s3_bucket.mybucket-v2.id
  key = aws_s3_object.java-jar-file.id
  name = "v1"
}