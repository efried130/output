# Data sources
data "aws_caller_identity" "current" {}

data "aws_cloudwatch_log_group" "cw_log_group" {
  name = "/aws/batch/job/${var.prefix}-output/"
}

data "aws_efs_file_system" "aws_efs_input" {
  creation_token = "${var.prefix}-input"
}

data "aws_efs_file_system" "aws_efs_flpe" {
  creation_token = "${var.prefix}-flpe"
}

data "aws_efs_file_system" "aws_efs_moi" {
  creation_token = "${var.prefix}-moi"
}

data "aws_efs_file_system" "aws_efs_diagnostics" {
  creation_token = "${var.prefix}-diagnostics"
}

data "aws_efs_file_system" "aws_efs_offline" {
  creation_token = "${var.prefix}-offline"
}

data "aws_efs_file_system" "aws_efs_validation" {
  creation_token = "${var.prefix}-validation"
}

data "aws_efs_file_system" "aws_efs_output" {
  creation_token = "${var.prefix}-output"
}

data "aws_iam_role" "job_role" {
  name = "${var.prefix}-batch-job-role"
}

data "aws_iam_role" "exe_role" {
  name = "${var.prefix}-ecs-exe-task-role"
}

# Local variables
locals {
  account_id = data.aws_caller_identity.current.account_id
  default_tags = length(var.default_tags) == 0 ? {
    application : var.app_name,
    environment : lower(var.environment),
    version : var.app_version
  } : var.default_tags
}