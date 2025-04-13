# Amazon Linux 2023 AMI
data "aws_ami" "latest_amazon_linux" {
  owners = ["amazon"]

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "description"
    values = ["Amazon Linux 2023 *"]
  }
  filter {
    name   = "platform-details"
    values = ["Linux/UNIX"]
  }
  filter {
    name   = "boot-mode"
    values = ["uefi-preferred"]
  }
  filter {
    name   = "state"
    values = ["available"]
  }
  most_recent = true
}
