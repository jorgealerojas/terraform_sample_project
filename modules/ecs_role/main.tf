data "aws_iam_policy_document" "task_execution_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name               = "${var.ecs_role_system_name}-task-exec-role"
  assume_role_policy = data.aws_iam_policy_document.task_execution_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
  role       = aws_iam_role.ecs_task_execution_role.name
}

data "aws_iam_policy_document" "ecs_manage_aws_services_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecs_managed_aws_services_role" {
  name               = "${var.ecs_role_system_name}-manage-aws-service-role"
  assume_role_policy = data.aws_iam_policy_document.ecs_manage_aws_services_assume_role_policy.json
}


