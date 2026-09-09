terraform {
  required_version = "~>1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# backend "s3" {
#     bucket = "aws_s3_bucket.UltimateDevops_S3_Terrafrom_Backend.id"
#     key    = "vpc/tfstate/"
#     encrypt = true
#     use_lockfile = true
#   }