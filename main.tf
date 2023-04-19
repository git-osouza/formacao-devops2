terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  profile = "default"
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0fcf52bcf5db7b003"
  instance_type = "t2.micro"
  key_name = "iac-oregon"
  tags = {
    Name = "Primeira instancia com AWS"
  }
}
