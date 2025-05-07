resource "aws_sfn_state_machine" "express" {
  name       = "express-steps"
  role_arn   = data.aws_iam_role.step_function.arn
  type       = "EXPRESS"
  definition = file("steps/express.json")
}
