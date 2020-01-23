//Select region
provider "aws" {
  region  = var.aws_region
  version = "2.45.0"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

//OS for instances
data "aws_ami" "this" {
  owners = ["099720109477"] // Canonical
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20191002"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
}

//Add key to aws account
resource "aws_key_pair" "this" {
  key_name   = "db_test"
  public_key = var.ssh_key
}

//Open all to internet
resource "aws_security_group_rule" "this" {
  type            = "ingress"
  from_port       = 0
  to_port         = 0
  protocol        = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpc.default_security_group_id
}

//Include https://github.com/terraform-aws-modules/terraform-aws-vpc module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.22.0"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = [format("%sa", var.aws_region)]
  public_subnets  = ["10.0.101.0/24"]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

//Create instance for launch of test
resource "aws_instance" "db_instance" {
  instance_type = var.instance_type
  ami = data.aws_ami.this.id

  subnet_id = module.vpc.public_subnets[0]

  key_name = aws_key_pair.this.key_name

  tags = {
    Name = "db_instance"
  }

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }
}

//Create database instance
resource "aws_instance" "db_data" {
  instance_type = var.instance_type
  ami = data.aws_ami.this.id

  subnet_id = module.vpc.public_subnets[0]

  key_name = aws_key_pair.this.key_name

  tags = {
    Name = "db_data"
  }

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }
}

//Create monitoring instance
resource "aws_instance" "monitoring" {
  instance_type = var.instance_type
  ami = data.aws_ami.this.id

  subnet_id = module.vpc.public_subnets[0]

  key_name = aws_key_pair.this.key_name

  tags = {
    Name = "monitoring"
  }

  root_block_device {
    volume_type = var.volume_type
    volume_size = var.volume_size
  }
}

output "db_instance_ip" {
  description = "[db_instance]"
  value = aws_instance.db_instance.public_ip
}
output "db_data_ip" {
  description = "[db_data]"
  value = aws_instance.db_data.public_ip
}
output "monitoring_ip" {
  description = "[monitoring]"
  value = aws_instance.monitoring.public_ip
}
