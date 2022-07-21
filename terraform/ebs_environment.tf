resource "aws_elastic_beanstalk_environment" "aws-ebs-env-java-project" {

  depends_on = [aws_elastic_beanstalk_application_version.aws-aws-ebs-app-java-project-java-project-ver]
  name = "java-upskilling-app"
  application = "${aws_elastic_beanstalk_application.aws-ebs-app-java-project.name}"
  solution_stack_name = "64bit Amazon Linux 2 v3.2.16 running Corretto 11"
  cname_prefix = "java-upskilling-app"
  version_label = "${aws_elastic_beanstalk_application_version.aws-aws-ebs-app-java-project-java-project-ver.name}"

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