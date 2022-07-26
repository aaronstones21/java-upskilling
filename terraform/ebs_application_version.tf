resource "aws_elastic_beanstalk_application_version" "aws-ebs-java-upskilling-ver" {
  depends_on = [aws_elastic_beanstalk_application.ebs-app]
  application = "${aws_elastic_beanstalk_application.ebs-app.name}"
  bucket = aws_s3_bucket.aws-s3-bucket-java-application.id
  key = aws_s3_object.java-jar-file.id
  name = "v-010"
}