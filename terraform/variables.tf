variable "aws_region" {
  description = "AWS region where resources will be provisioned"
  type        = string
  default     = "eu-west-1"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0de864d6a3bd20ea8"
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t2.large"
}

variable "my_environment" {
  description = "Deployment environment (dev, staging, prd)"
  type        = string
  default     = "dev"  
}