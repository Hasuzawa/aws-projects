resource "aws_efs_access_point" "ap" {
  file_system_id = aws_efs_file_system.one_zone.id
  root_directory {
    path = "/"
  }
  tags = {
    Name = "access-point"
  }
}
