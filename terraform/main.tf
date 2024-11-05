terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  backend "s3" {
    bucket = "gitops-tf-state-backend"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "terraform-state-backend" {
  bucket = "gitops-tf-state-backend"

  tags = {
    Name = "Terraform State Backend"
  }
}
