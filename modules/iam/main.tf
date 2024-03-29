module "labels" {
  source = "cloudposse/label/null"
  name   = var.name
}


### Defines an IAM role ###

resource "aws_iam_role" "get_all_courses_lambda_role" {
  name = "${module.labels.id}-get-all-courses-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_role" "get_all_authors_lambda_role" {
  name = "${module.labels.id}-get-all-authors-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_role" "get_course_lambda_role" {
  name = "${module.labels.id}-get-course-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}


resource "aws_iam_role" "save_course_lambda_role" {
  name = "${module.labels.id}-save-course-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_role" "delete_course_lambda_role" {
  name = "${module.labels.id}-delete-course-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

resource "aws_iam_role" "update_course_lambda_role" {
  name = "${module.labels.id}-update-course-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow"
    }]
  })
}

### Creates a data source ###


resource "aws_iam_policy" "get_all_courses_lambda_policy" {
  name = "${module.labels.id}-get-all-courses-lambda-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "dynamodb:Scan",
        ],
      Resource = var.dynamodb_courses_arn,
      Effect   = "Allow"
    },
    {
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "arn:aws:logs:*:*:*",
      Effect   = "Allow"
    }]
  })
}

resource "aws_iam_policy" "get_all_authors_lambda_policy" {
  name = "${module.labels.id}-get-all-authors-lambda-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "dynamodb:Scan",
        ],
      Resource = var.dynamodb_authors_arn,
      Effect   = "Allow"
    },
    {
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "arn:aws:logs:*:*:*",
      Effect   = "Allow"
    }]
  })
}

resource "aws_iam_policy" "get_course_lambda_policy" {
  name = "${module.labels.id}-get-course-lambda-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "dynamodb:GetItem"
        ],
      Resource = var.dynamodb_courses_arn,
      Effect   = "Allow"
    },
    {
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "arn:aws:logs:*:*:*",
      Effect   = "Allow"
    }]
  })
}

resource "aws_iam_policy" "save_course_lambda_policy" {
  name = "${module.labels.id}-save-course-lambda-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "dynamodb:PutItem"
        ],
      Resource = var.dynamodb_courses_arn,
      Effect   = "Allow"
    },
    {
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "arn:aws:logs:*:*:*",
      Effect   = "Allow"
    }]
  })
}

resource "aws_iam_policy" "delete_course_lambda_policy" {
  name = "${module.labels.id}-delete-course-lambda-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "dynamodb:DeleteItem"
        ],
      Resource = var.dynamodb_courses_arn,
      Effect   = "Allow"
    },
    {
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "arn:aws:logs:*:*:*",
      Effect   = "Allow"
    }]
  })
}

resource "aws_iam_policy" "update_course_lambda_policy" {
  name = "${module.labels.id}-update-course-lambda-policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = [
        "dynamodb:PutItem"
        ],
      Resource = var.dynamodb_courses_arn,
      Effect   = "Allow"
    },
    {
      Action = [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      Resource = "arn:aws:logs:*:*:*",
      Effect   = "Allow"
    }]
  })
}

### Defines an IAM policy ###


resource "aws_iam_role_policy_attachment" "get_all_courses_lambda_policy_attachment" {
  role       = aws_iam_role.get_all_courses_lambda_role.name
  policy_arn = aws_iam_policy.get_all_courses_lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "get_all_authors_lambda_policy_attachment" {
  role       = aws_iam_role.get_all_authors_lambda_role.name
  policy_arn = aws_iam_policy.get_all_authors_lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "get_course_lambda_policy_attachment" {
  role       = aws_iam_role.get_course_lambda_role.name
  policy_arn = aws_iam_policy.get_course_lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "save_course_lambda_policy_attachment" {
  role       = aws_iam_role.save_course_lambda_role.name
  policy_arn = aws_iam_policy.save_course_lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "delete_course_lambda_policy_attachment" {
  role       = aws_iam_role.delete_course_lambda_role.name
  policy_arn = aws_iam_policy.delete_course_lambda_policy.arn
}

resource "aws_iam_role_policy_attachment" "update_course_lambda_policy_attachment" {
  role       = aws_iam_role.update_course_lambda_role.name
  policy_arn = aws_iam_policy.update_course_lambda_policy.arn
}
