resource "aws_storagegateway_tape_pool" "deep_archive" {
  pool_name                   = lower("Glacier-Deep-Archive-Pool")
  storage_class               = "DEEP_ARCHIVE"
  retention_lock_type         = "COMPLIANCE"
  retention_lock_time_in_days = 3
}

resource "aws_storagegateway_tape_pool" "flexible_retrieval" {
  pool_name                   = lower("Glacier-Flexible-Retrieval-Pool")
  storage_class               = "GLACIER"
  retention_lock_type         = "GOVERNANCE"
  retention_lock_time_in_days = 7
}
