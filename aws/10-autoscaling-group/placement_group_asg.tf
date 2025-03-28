resource "aws_launch_template" "cluster" {
  name          = "cluster-placement"
  description   = "instance for cluster placement"
  instance_type = "c4.large" # old types might not be supported for cluster placement
  image_id      = "ami-05506fa68391b4cb1"
}

# The instances will be in same AZ (likely the first one)
resource "aws_autoscaling_group" "cluster" {
  min_size           = 3
  max_size           = 3
  availability_zones = data.aws_availability_zones.available.names
  placement_group    = aws_placement_group.cluster.name
  launch_template {
    name = aws_launch_template.cluster.name
  }
  tag {
    key                 = "Name"
    value               = "cluster"
    propagate_at_launch = true
  }
}

resource "aws_launch_template" "simple" {
  name          = "simple-t2-micro"
  description   = "defined launch template, no override needed"
  instance_type = "t2.micro"
  image_id      = "ami-05506fa68391b4cb1"
}

# The instances will be in different AZ
resource "aws_autoscaling_group" "spread" {
  min_size           = 3
  max_size           = 3
  availability_zones = data.aws_availability_zones.available.names
  placement_group    = aws_placement_group.spread.name
  launch_template {
    name = aws_launch_template.simple.name
  }
  tag {
    key                 = "Name"
    value               = "spread"
    propagate_at_launch = true
  }
}
