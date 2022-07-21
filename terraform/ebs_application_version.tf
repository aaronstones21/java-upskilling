resource "aws_elastic_beanstalk_application_version" "aws-aws-ebs-app-java-project-java-project-ver" {
  depends_on = [aws_elastic_beanstalk_application.aws-ebs-app-java-project]
  application = "${aws_elastic_beanstalk_application.aws-ebs-app-java-project.name}"
  bucket = aws_s3_bucket.aws-s3-bucket-java-project.id
  key = aws_s3_object.java-jar-file.id
  name = "v1"
}