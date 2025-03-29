# this would be an on-demand data stream with managed shard
resource "aws_kinesis_stream" "on_demand" {
  name = "on-demand"
  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }
}

resource "aws_kinesis_stream" "provisioned" {
  name        = "provisioned"
  shard_count = 3 # min 2
  stream_mode_details {
    stream_mode = "PROVISIONED"
  }
  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes"
  ]
  retention_period = 24 * 7 # hour to retent data, default 24
}
