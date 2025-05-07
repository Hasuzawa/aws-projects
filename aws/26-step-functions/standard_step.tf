resource "aws_sfn_state_machine" "standard" {
  name       = "standard-steps"
  role_arn   = ""
  definition = file("steps/standard.json")
}
