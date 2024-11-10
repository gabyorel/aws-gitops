variable "instance_type" {
  type        = string
  description = "EC2 Instance Type"
}

variable "global" {
  type        = bool
  description = "Controls whether the resource should be created globally"
}

variable "namespace" {
  type        = string
  description = "Docker Namespace"
}

variable "environment" {
  type = string
}