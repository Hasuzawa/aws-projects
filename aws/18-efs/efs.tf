resource "aws_efs_file_system" "regional" {
  throughput_mode  = "elastic"
  performance_mode = "generalPurpose"

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }
  lifecycle_policy {
    transition_to_archive = "AFTER_60_DAYS"
  }
  lifecycle_policy {
    transition_to_primary_storage_class = "AFTER_1_ACCESS" # back to original class
  }

  tags = {
    Name = "regional-efs"
  }
}

resource "aws_efs_file_system" "one_zone" {
  availability_zone_name          = "ap-northeast-1a"
  throughput_mode                 = "provisioned"
  provisioned_throughput_in_mibps = 5
  performance_mode                = "generalPurpose"
  encrypted                       = true

  protection {
    replication_overwrite = "ENABLED" # enabled by default
  }

  tags = {
    Name = "one-zone-efs"
  }
}
