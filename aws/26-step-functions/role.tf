# The execution role for step functions need to have permission to perform actions in the state machine
data "aws_iam_role" "step_function" {
  name = "StepFunctions-develop-role-f20bbp9ya"
}
