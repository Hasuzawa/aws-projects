terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

locals {
  provider_tags = {
    Managed = "terraform"
    Project = var.project_name
  }
}

provider "aws" {
  default_tags {
    tags = local.provider_tags
  }
}
