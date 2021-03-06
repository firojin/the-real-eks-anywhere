terraform {
  required_version = ">= 0.14.2"
  required_providers {
    aws = {
      version = ">= 3.22"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket         = "tf-state-391996659322"
    key            = "tf-eks-anywhere/step3/terraform.tfstate"
    region         = "eu-central-1"
    encrypt        = true
    dynamodb_table = "tf_state_lock_391996659322"
  }
}

provider "aws" {
  region = "eu-central-1"
}

data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "tf-state-391996659322"
    key    = "tf-eks-anywhere/step1/terraform.tfstate"
    region = "eu-central-1"
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = "tf-state-391996659322"
    key    = "tf-eks-anywhere/step2/terraform.tfstate"
    region = "eu-central-1"
  }
}
