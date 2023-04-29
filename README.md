###Terraform AWS Serverless Application for Message New Function

This Terraform code creates the AWS infrastructure needed to deploy the message-new function. The infrastructure includes an API Gateway endpoint that invokes the function, and a DynamoDB table that stores the message history.

##Prerequisites

- An AWS account with the appropriate permissions to create and manage the resources defined in this code.
- Terraform version 1.0.0 or later installed on your machine.
##Usage
1. Clone this repository to your local machine.
2. Navigate to the repository directory in your terminal.
3. Run terraform init to download and install the necessary Terraform plugins and modules.
4. Run terraform plan to see the changes that Terraform will make to your AWS infrastructure.
5. Run terraform apply to create or update the infrastructure on AWS.

##Configuration

#Variables
The following variables can be customized by creating a terraform.tfvars file:

- region: The AWS region where the resources will be created. Default is us-east-1.
- lambda_function_filename: The name of the ZIP file containing the function code. Default is lambda.zip.

#Outputs
The following outputs are available after running terraform apply:

- api_gateway_endpoint: The URL of the API Gateway endpoint that invokes the message-new function.
- dynamodb_table_arn: The ARN of the DynamoDB table that stores the message history.

##Cleanup
To destroy the AWS resources created by this code, run terraform destroy.

