# #-----provider.tf-----
# #===================
terraform {
  required_providers {
    aws = {
      version = "~> 3.44.0"
    }
  }
  required_version = ">= 0.15.5"
}

provider "aws" {
  region = var.region
}

/*
terraform {
  backend "s3" {
    bucket         = "terraform-file-state"
    key            = "key/terraform.tfstate"
    dynamodb_table = "tf-up-and-run-locks"
    encrypt        = true
    }
}
*/
