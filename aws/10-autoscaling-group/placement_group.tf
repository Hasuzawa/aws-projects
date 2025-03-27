resource "aws_placement_group" "cluster" {
  name     = "demo-cluster-group"
  strategy = "cluster"
}

resource "aws_placement_group" "partition" {
  name            = "demo-partition-group"
  strategy        = "partition"
  partition_count = 3	# default is 2
}

resource "aws_placement_group" "spread" {
  name         = "demo-spread-group"
  strategy     = "spread"
  spread_level = "rack"
}
