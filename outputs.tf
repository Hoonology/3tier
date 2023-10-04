output "rds_endpoint" {
  description = "The connection endpoint for the RDS DB instance."
  value       = module.rds.rds_endpoint
}
