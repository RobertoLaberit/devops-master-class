terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "iam_user_name_prefix" {
  default = "my_iam_user"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "my_iam_users" {
  count = 3
  name  = "${var.iam_user_name_prefix}_${count.index}"
}