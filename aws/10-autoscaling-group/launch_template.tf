resource "aws_launch_template" "zero" {
  name        = "zero-config"
  description = "template with all default values"
}

resource "aws_launch_template" "customized" {
  name          = "customized"
  description   = "highly customized template"
  instance_type = "t3.micro"

  cpu_options {
    # these depends on instance type
    core_count       = 2
    threads_per_core = 2
  }

  enclave_options {
    enabled = true
  }

  hibernation_options {
    configured = true
  }

  instance_initiated_shutdown_behavior = "stop" # default, can choose terminate

  instance_market_options {
    # market_type = "spot"
    # spot_options {
    # 	max_price = "0.0001"
    # }
  }

  maintenance_options {
  }

  metadata_options {
  }
  network_interfaces {
  }
  placement {
    affinity = "" # only relevant when on dedicated host
    # availability_zone = ""
    # partition_number = 0 # only relevant for group strategy partition
  }
}

resource "aws_launch_template" "asg" {
  name          = "asg-template"
  description   = "this launch template can be used for autoscaling group"
  instance_type = "" # not needed if all override specified instance type
  image_id      = "ami-05506fa68391b4cb1"
}
