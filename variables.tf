variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC cidr block"
  default     = "10.0.0.0/16"
}

# Subnet

variable "public_subnet_1_cidr" {
  description = "cidr block for public subnet 1"
  default     = "10.0.1.0/24"
}


variable "public_subnet_2_cidr" {
  description = "cidr block for public subnet 2"
  default     = "10.0.2.0/24"
}


variable "private_app_subnet_1_cidr" {
  description = "cidr block for private app subnet 1"
  default     = "10.0.3.0/24"
}


variable "private_app_subnet_2_cidr" {
  description = "cidr block for private app subnet 2"
  default     = "10.0.4.0/24"
}


variable "private_db_subnet_1_cidr" {
  description = "cidr block for private db subnet 1"
  default     = "10.0.5.0/24"
}


variable "private_db_subnet_2_cidr" {
  description = "cidr block for private db subnet 2"
  default     = "10.0.6.0/24"
}

# EC2 Variables

variable "amis" {
  description = "Amazon Linux 2"
  type        = map(any)
  default = {
    "us-east-1" = "ami-006dcf34c09e50022"
    "us-east-2" = "ami-0f3c9c466bb525749"
  }
}

variable "instance_type" {
  description = "EC2 Instance type"
  default     = "t2.micro"
}

variable "key_name" {}
