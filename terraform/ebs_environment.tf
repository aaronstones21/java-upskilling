resource "aws_elastic_beanstalk_environment" "aws-ebs-java-upskilling-project-env" {

  depends_on = [aws_elastic_beanstalk_application_version.aws-ebs-java-upskilling-ver]
  name = var.JUR_VERSION
  application = aws_elastic_beanstalk_application.ebs-app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.2.16 running Corretto 11"
  cname_prefix = var.JUR_VERSION
  version_label = aws_elastic_beanstalk_application_version.aws-ebs-java-upskilling-ver.name

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name = "SERVER_PORT"
    value = "5000"
  }

  setting {
   namespace = "aws:autoscaling:launchconfiguration"
   name = "IamInstanceProfile"
   value = "aws-elasticbeanstalk-ec2-role"
  }

}