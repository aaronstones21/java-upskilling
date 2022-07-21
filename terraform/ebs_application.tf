resource "aws_elastic_beanstalk_application" "aws-ebs-app-java-project" {
  name = "java-upskilling-app"
  description = "This is a demo elastic beanstalk environment"
  appversion_lifecycle {
    service_role = "arn:aws:iam::032186028833:role/aws-service-role/elasticbeanstalk.amazonaws.com/AWSServiceRoleForElasticBeanstalk"
    max_count = 128
    delete_source_from_s3 = false
  }
}