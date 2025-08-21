variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "ade-ec2-instance"
}

variable "ec2_ami" {
  description = "list of all ec2 ami"
  type        = string
  default     = "ami-020cba7c55df1f615"

}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "ade-terraform-bucket-state-2699"
}

variable "bucket_folder" {
  description = "Name of bucket folder"
  type        = string
  default     = "ec2_public_keys"
}

variable "ec2_port_number" {
  description = "value of ec2 port number"
  type        = list(number)
  default     = [22, 80]
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t3.micro"
}