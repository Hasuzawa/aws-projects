resource "aws_sfn_state_machine" "standard" {
  name       = "standard-steps"
  role_arn   = data.aws_iam_role.step_function.arn
  type       = "STANDARD"
  definition = file("steps/standard.json")
}
