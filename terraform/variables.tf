variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "global" {
  type        = bool
  description = "Controls whether the resource should be created globally"
}

variable "environment" {
  type = string
}