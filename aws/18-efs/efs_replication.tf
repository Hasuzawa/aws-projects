resource "aws_efs_file_system" "replication_source" {
  throughput_mode  = "elastic"
  performance_mode = "generalPurpose"
  tags = {
    Name = "replication-source"
  }
}

resource "aws_efs_file_system" "replication_destination" {
  throughput_mode  = "elastic"
  performance_mode = "generalPurpose"
  protection {
    replication_overwrite = "DISABLED"
  }
  tags = {
    Name = "replication-destination"
  }
}

resource "aws_efs_replication_configuration" "config" {
  source_file_system_id = aws_efs_file_system.replication_source.id

  destination {
    file_system_id = aws_efs_file_system.replication_destination.id
    region         = "ap-northeast-1"
  }
}
