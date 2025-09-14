terraform {
  required_version = ">= 1.1.0, <= 1.3.10"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.44.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
}
