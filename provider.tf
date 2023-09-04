  terraform {
    backend "s3" {
    bucket = "travisbackend1234"
    dynamodb_table = "state-lock"
    key = "global/mystatefile/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  }
provider "aws" {
    region = "us-east-1"
  
}
# we will create a VPC, 2 subnets, 2 ec2 instances create sg and attached create igw craete a rt and associates igw rt and subnet