variable "AWS_ACCESS_KEY_ID" {
  type = string
  description = "AWS Access Key ID for authenticating the AWS client"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
  description = "AWS Secret Access Key for authenticating the AWS client"
}

variable "AWS_IAM_USER" {
  type = string
  description = "The IAM Service Role needed to use the EBS system"
}

variable "JUR_VERSION" {
  type = string 
  default = "java-project-010-SNAPSHOT"
  description = "Version of the project to keep the AWS EBS name unique"
}