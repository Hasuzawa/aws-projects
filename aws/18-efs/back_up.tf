resource "aws_efs_backup_policy" "policy" {
  file_system_id = aws_efs_file_system.regional.id

  backup_policy {
    status = "ENABLED"
  }
}
