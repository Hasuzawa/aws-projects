resource "aws_spot_instance_request" "sample" {
  ami                            = data.aws_ami.latest_amazon_linux.image_id
  instance_type                  = "t2.micro"
  instance_interruption_behavior = "terminate"
  spot_type                      = "one-time"
  spot_price                     = "0.0045" # also accept on-demand
  wait_for_fulfillment           = false
}
