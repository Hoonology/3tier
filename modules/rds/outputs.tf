output "rds_endpoint" {
  description = "The connection endpoint for the RDS DB instance."
  value       = aws_db_instance.rds-instance.endpoint
}
