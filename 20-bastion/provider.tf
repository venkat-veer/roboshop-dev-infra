terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.16.0"
    }
  }

  backend "s3" {
    bucket = "remote-state-venkat-dev"          # from AWS s3 buckets ok check in u r AWS
    key = "roboshop-dev-bastion"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}