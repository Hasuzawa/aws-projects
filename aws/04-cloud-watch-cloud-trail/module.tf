module "vpc" {
  source = "../module/vpc"

  availability_zone = "ap-northeast-1a"
  project_name      = var.project_name
}
