provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "netol-test"
    key    = "test/terraform.tfstate"
    region = "us-west-2"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

locals {
  instances = {
  "t2.micro" = data.aws_ami.amazon_linux.id
  "t2.large" = data.aws_ami.amazon_linux.id
  "t2.large" = data.aws_ami.amazon_linux.id
}

}


resource "aws_instance" "web" {
  for_each = local.instances
  ami = each.value
  instance_type = each.key
}


data "aws_caller_identity" "current" {}
