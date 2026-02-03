terraform {

  # adding backend as s3 for Remote state storage
  backend "s3" {
    bucket = "ade-terraform-bucket-state-2699"
    key    = "aws-eks-cluster1/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}