variable "application_name" {
  default = "07-backend-state"
}

variable "project_name" {
  default = "users"
}

variable "environment" {
  default = "dev"
}

terraform {
  backend "s3" {
    bucket         = "dev-applications-name-backend-state-laberit-abc"
    key            = "dev/07-backend-state/users/backend-state"
    region         = "eu-west-3"
    dynamodb_table = "dev_applications_locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

resource "aws_iam_user" "my_iam_user" {
  name = "${terraform.workspace}_my_iam_user_abc"
}