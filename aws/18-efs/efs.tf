resource "aws_efs_file_system" "demo_0" {
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
