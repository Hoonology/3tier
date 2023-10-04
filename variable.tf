variable "DB_USER" {
  description = "The username for the DB instance"
  type        = string
}

variable "DB_PASSWORD" {
  description = "The password for the DB instance"
  type        = string
  sensitive   = true
}
