terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  shared_config_files      = "eu-central-1"
  shared_credentials_files = "~/.aws/credentials"
  profile                  = "myprofile"
}

