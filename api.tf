# Create an API Gateway endpoint for message new
resource "aws_api_gateway_rest_api" "message_new_api" {
  name        = "MessageNewApi"
  description = "Message New API"
}

resource "aws_api_gateway_resource" "message_new_resource" {
  rest_api_id = aws_api_gateway_rest_api.message_new_api.id
  parent_id   = aws_api_gateway_rest_api.message_new_api.root_resource_id
  path_part   = "message"
}

resource "aws_api_gateway_resource" "message_new_subresource" {
  rest_api_id = aws_api_gateway_rest_api.message_new_api.id
  parent_id   = aws_api_gateway_resource.message_new_resource.id
  path_part   = "new"
}

resource "aws_api_gateway_method" "message_new_method" {
  rest_api_id   = aws_api_gateway_rest_api.message_new_api.id
  resource_id   = aws_api_gateway_resource.message_new_subresource.id
  http_method   = "POST"
  authorization = "NONE"
}

# Connect the method to the Lambda function
resource "aws_api_gateway_integration" "message_new_integration" {
  rest_api_id = aws_api_gateway_rest_api.message_new_api.id
  resource_id = aws_api_gateway_resource.message_new_subresource.id
  http_method = aws_api_gateway_method.message_new_method.http_method
  integration_http_method = "POST"
  type = "AWS_PROXY"
  uri = aws_lambda_function.message_new_lambda_function.invoke_arn
}

# Deploy the API
resource "aws_api_gateway_deployment" "message_new_deployment" {
  rest_api_id = aws_api_gateway_rest_api.message_new_api.id
  stage_name  = "test"
}