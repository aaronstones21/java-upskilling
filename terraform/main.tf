provider "aws" {
  region = "eu-west-2"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_s3_bucket" "s3_bucket_myapp" {
  bucket = "myapp-prod-remastered-baby"
  acl = "private"
}

resource "aws_s3_bucket_object" "s3_bucket_object_myapp" {
  bucket = aws_s3_bucket.s3_bucket_myapp.id
  key = "beanstalk/myapp"
  source = "./target/upskilling-0.0.1-SNAPSHOT.jar"
}

resource "aws_elastic_beanstalk_application" "beanstalk_myapp" {
  name = "myapp-4"
  description = "The description of my application"
}

resource "aws_elastic_beanstalk_application_version" "beanstalk_myapp_version" {
  application = aws_elastic_beanstalk_application.beanstalk_myapp.name
  bucket = aws_s3_bucket.s3_bucket_myapp.id
  key = aws_s3_bucket_object.s3_bucket_object_myapp.id
  name = "myapp-1.0.0"
}

resource "aws_elastic_beanstalk_environment" "beanstalk_myapp_env" {
  name = "myapp-prod-4"
  application = aws_elastic_beanstalk_application.beanstalk_myapp.name
  solution_stack_name = "64bit Amazon Linux 2 v3.2.16 running Corretto 11"
  version_label = aws_elastic_beanstalk_application_version.beanstalk_myapp_version.name

  setting {
    name = "SERVER_PORT"
    namespace = "aws:elasticbeanstalk:application:environment"
    value = "5000"
  }

  setting {
    namespace = "aws:ec2:instances"
    name = "InstanceTypes"
    value = "t2.micro"
  }
  
  setting {
   namespace = "aws:autoscaling:launchconfiguration"
   name = "IamInstanceProfile"
   value = "aws-elasticbeanstalk-ec2-role"
  }
}