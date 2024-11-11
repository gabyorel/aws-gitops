terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
    docker = {
      source = "docker/docker"
      version = "~> 0.3"
    }
  }

  backend "s3" {
    bucket = "gitops-tf-state-backend"
    region = "us-east-1"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = var.environment
      ManagedBy = "Terraform"
    }
  }
}

provider "docker" {}

resource "docker_hub_repository" "dynamodb-tictactoe-app" {
  count     = var.global ? 1 : 0
  namespace = var.namespace
  name      = "dynamodb-tictactoe-app"
  private   = true
}