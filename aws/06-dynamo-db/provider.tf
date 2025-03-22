terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Managed = "terraform"
      Project = var.project_name
    }
  }
}

# alternative providers for deploying resources in other regions
provider "aws" {
  alias  = "us"
  region = "us-west-1"

  default_tags {
    tags = {
      Managed = "terraform"
      Project = var.project_name
    }
  }
}

provider "aws" {
  alias  = "eu"
  region = "eu-central-1"

  default_tags {
    tags = {
      Managed = "terraform"
      Project = var.project_name
    }
  }
}
