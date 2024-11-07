variable "instance_name" {
  type        = string
  description = "EC2 Instance Name"
}

variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "ami" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}

variable "repo_url" {
  type = string
}

variable "html_folder" {
  type = string
}

variable "environment" {
  type = string
}
