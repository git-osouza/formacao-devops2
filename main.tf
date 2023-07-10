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
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0fcf52bcf5db7b003"
  instance_type = "t2.micro"
  key_name = "iac-oregon"
 user_data = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                echo ?<h1>Criado com terraform</h1>? > index.html
                nohup busybox httpd -f -p 8080 &
                EOF
  tags = {
    Name = "Teste AWS new 2"
  }
}
