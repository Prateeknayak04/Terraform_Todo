terraform {
  backend "s3" {
    bucket = "my-terraform-demo-test-s3-bucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
  }
}

provider "aws" {
    region = var.aws_region 
}