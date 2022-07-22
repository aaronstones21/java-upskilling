resource "aws_elastic_beanstalk_environment" "ebs-env" {

  depends_on = [aws_elastic_beanstalk_application_version.ebs-app-ver]
  name = "my-sample-application-dev"
  application = "${aws_elastic_beanstalk_application.ebs-app.name}"
  solution_stack_name = "64bit Amazon Linux 2 v3.2.16 running Corretto 11"
  cname_prefix = "my-sample-application-dev"
  version_label = "${aws_elastic_beanstalk_application_version.ebs-app-ver.name}"

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