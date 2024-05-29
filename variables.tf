variable "region" {
  description = "The AWS region to create resources in"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI to use for the instance"
  default     = "ami-00fa32593b478ad6e"
}

variable "key_name" {
  description = "The name of the SSH key pair"
  default     = "celestine-onyango2.pem"
}

variable "private_key_path" {
  description = "Path to the private key file for SSH access"
  default     = "~/.ssh/celestine-onyango2.pem"
}