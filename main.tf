# main.tf

terraform {
  required_version = "~>1.8.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "=5.49"
    }
  }
}

# Define the AWS provider
provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    acm            = "http://localhost:4566"
    apigateway     = "http://localhost:4566"
    apigatewayv2   = "http://localhost:4566"
    cloudformation = "http://localhost:4566"
    cloudwatch     = "http://localhost:4566"
    dynamodb       = "http://localhost:4566"
    ec2            = "http://localhost:4566"
    es             = "http://localhost:4566"
    elasticache    = "http://localhost:4566"
    firehose       = "http://localhost:4566"
    iam            = "http://localhost:4566"
    kinesis        = "http://localhost:4566"
    lambda         = "http://localhost:4566"
    rds            = "http://localhost:4566"
    redshift       = "http://localhost:4566"
    route53        = "http://localhost:4566"
    s3             = "http://s3.localhost.localstack.cloud:4566"
    secretsmanager = "http://localhost:4566"
    ses            = "http://localhost:4566"
    sns            = "http://localhost:4566"
    sqs            = "http://localhost:4566"
    ssm            = "http://localhost:4566"
    stepfunctions  = "http://localhost:4566"
    sts            = "http://localhost:4566"
  }
}

# Create an API Gateway v2 HTTP API
resource "aws_apigatewayv2_api" "my_test_api" {
  name                       = "my_test_api"
  protocol_type              = "HTTP"
  route_selection_expression = "$request.method $request.path"
}


resource "aws_apigatewayv2_authorizer" "my_test_api_authorizer" {
  api_id          = aws_apigatewayv2_api.my_test_api.id
  authorizer_type = "JWT"
  identity_sources = [
    "$request.header.Authorization"
  ]
  name = "my_test_api_authorizer"

  authorizer_payload_format_version = "2.0"

  jwt_configuration {
    audience = ["https://fabric-studio-authorizer.test"]
    issuer   = "https://dev-lpjrjy1zlx337dil.eu.auth0.com/"
  }
}

# Deploy the API Gateway
resource "aws_apigatewayv2_stage" "localstack_stage" {
  api_id      = aws_apigatewayv2_api.my_test_api.id
  name        = "localstack"
  auto_deploy = true
}

resource "aws_apigatewayv2_deployment" "localstack_deployment" {
  api_id      = aws_apigatewayv2_api.my_test_api.id
  description = "LocalStack deployment"
}

# Create AWS Lambda zip file
data "archive_file" "test_lambda_archive" {
  type        = "zip"
  source_dir  = "${path.module}/build"
  output_path = "${path.module}/build/my_lambda.zip"
}

# Test Service
resource "aws_lambda_function" "test_jwt_lambda" {
  function_name = "testJwtLambda"
  runtime       = "nodejs20.x"
  handler       = "handler.main"
  role          = "arn:aws:iam::000000000000:role/lambda-role"

  environment {
    variables = {
      NODE_OPTIONS = "--enable-source-maps"
    }
  }

  filename         = abspath("${path.module}/build/my_lambda.zip")
  source_code_hash = data.archive_file.test_lambda_archive.output_base64sha256
}

resource "aws_apigatewayv2_integration" "my_test_api_integration" {
  api_id                 = aws_apigatewayv2_api.my_test_api.id
  integration_type       = "AWS_PROXY"
  connection_type        = "INTERNET"
  integration_uri        = aws_lambda_function.test_jwt_lambda.invoke_arn
  integration_method     = "GET"
  payload_format_version = "2.0"
}


resource "aws_apigatewayv2_route" "my_test_api_route" {
  api_id             = aws_apigatewayv2_api.my_test_api.id
  route_key          = "GET /v1/user"
  target             = "integrations/${aws_apigatewayv2_integration.my_test_api_integration.id}"
  authorization_type = "JWT"
  authorizer_id      = aws_apigatewayv2_authorizer.my_test_api_authorizer.id
}
