module "vpc" {
  source = "../module/vpc"

  project           = var.project
  availability_zone = "ap-northeast-1a"
}
