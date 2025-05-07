resource "aws_sfn_state_machine" "standard" {
  name       = "express-steps"
  role_arn   = ""
  type       = "EXPRESS"
  definition = file("steps/express.json")
}
