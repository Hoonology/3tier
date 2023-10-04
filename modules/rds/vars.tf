variable "DB_USER" {
  description = "The username for the DB instance"
  type        = string
}

variable "DB_PASSWORD" {
  description = "The password for the DB instance"
  type        = string
  sensitive   = true
}
variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs"
  type        = list(string)
}
