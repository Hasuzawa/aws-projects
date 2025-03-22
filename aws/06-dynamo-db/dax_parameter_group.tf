resource "aws_dax_parameter_group" "dev" {
  name        = var.project_name
  description = "dev dax parameter group for ${var.project_name}"

  parameters {
    name  = "record-ttl-millis"
    value = 6 * 60 * 60 * 1000 # 6 hrs
  }

  parameters {
    name  = "query-ttl-millis"
    value = 15 * 60 * 1000 # 15 minutes
  }
}

resource "aws_dax_parameter_group" "permanent" {
  name        = "permanent-cache"
  description = "will never evict record, no cache for query"

  parameters {
    name  = "record-ttl-millis"
    value = 0
  }

  parameters {
    name  = "query-ttl-millis"
    value = 0
  }
}
