resource "aws_sfn_state_machine" "standard" {
  name       = "express-steps"
  role_arn   = ""
  definition = file("steps/express.json")
}
