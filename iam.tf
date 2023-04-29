# Create an IAM role for the Lambda function
resource "aws_iam_role" "message_new_lambda_role" {
  name = "message-new-lambda-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

# Attach permissions to the role
resource "aws_iam_role_policy_attachment" "message_new_lambda_policy_attachment" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  role       = aws_iam_role.message_new_lambda_role.name
}
