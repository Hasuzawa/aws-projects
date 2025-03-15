module "vpc" {
  source = "../module/vpc"

  project           = "04"
  availability_zone = "ap-northeast-1a"
}
