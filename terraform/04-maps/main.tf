terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "users" {
  default = {
    d10s : { country : "Argentina", department : "Football" },
    roberto : { country : "Spain", department : "Devops" },
    ranga : { country : "India", department : "Formation" }
  }
}


provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "my_iam_users" {
  for_each = var.users
  name     = each.key
  tags = {
    country : each.value.country
    department : each.value.department
  }
}