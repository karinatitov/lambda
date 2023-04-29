# Create a Lambda function
resource "aws_lambda_function" "message_new_lambda_function" {
  filename      = "lambda.zip"
  function_name = "message-new"
  role          = aws_iam_role.message_new_lambda_role.arn
  handler       = "index.handler"
  runtime       = "nodejs14.x"
  timeout       = 60
  memory_size   = 128
  environment {
    variables = {
      TABLE_NAME = aws_dynamodb_table.message_history.name
    }
  }
}

