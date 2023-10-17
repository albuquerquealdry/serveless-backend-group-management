terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }

  required_version = ">= 0.15"
}

provider "aws" {
  profile = "default"
  region  = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "backend-state-tf-0001"
    key            = "dev"
    region         = "us-east-1"
  }
}