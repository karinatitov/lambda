# Create a DynamoDB table for message history
resource "aws_dynamodb_table" "message_history" {
  name           = "MessageHistory"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  attribute {
    name = "UserId"
    type = "S"
  }
  range_key      = "Timestamp"
  attribute {
    name = "Timestamp"
    type = "S"
  }
}
