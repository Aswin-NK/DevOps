terraform {
  required_version = ">= 1.6" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    null = {
      source = "hashicorp/null"
      version = "~> 3.0"
    }        
  }
}

provider "aws" {
  region = "us-east-1"
}