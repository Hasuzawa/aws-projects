resource "aws_ebs_volume" "shared_volume" {
  availability_zone    = aws_subnet.subnet.availability_zone
  type                 = "io2"
  iops                 = 200 # iops / volume cannot exceed 50
  size                 = 8
  multi_attach_enabled = true
  tags = {
    Name = "multi-attach-volume"
  }
}

resource "aws_ebs_volume" "gp3_volume" {
  availability_zone = aws_subnet.subnet.availability_zone
  type              = "gp3"
  size              = 8
  tags = {
    Name = "vol-gp3"
  }
}

resource "aws_ebs_volume" "gp2_volume" {
  availability_zone = aws_subnet.subnet.availability_zone
  type              = "gp2"
  size              = 8
  tags = {
    Name = "vol-gp2"
  }
}

resource "aws_volume_attachment" "attachment_0" {
  instance_id = aws_instance.instance.id
  volume_id   = aws_ebs_volume.gp3_volume.id
  device_name = "/dev/sdf"
}

resource "aws_volume_attachment" "attachment_1" {
  instance_id = aws_instance.instance.id
  volume_id   = aws_ebs_volume.gp2_volume.id
  device_name = "/dev/sdg"
}

resource "aws_volume_attachment" "shared_attachment_0" {
  instance_id = aws_instance.instance_1.id
  volume_id   = aws_ebs_volume.shared_volume.id
  device_name = "/dev/sdf"
}

resource "aws_volume_attachment" "shared_attachment_1" {
  instance_id = aws_instance.instance_2.id
  volume_id   = aws_ebs_volume.shared_volume.id
  device_name = "/dev/sdf"
}
