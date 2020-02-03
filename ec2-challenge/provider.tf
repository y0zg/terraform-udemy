# Configure the AWS Provider
provider "aws" {
  alias                   = "us-east-1"
  version                 = "~> 2.0"
  region                  = "us-east-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "awstraining"
}