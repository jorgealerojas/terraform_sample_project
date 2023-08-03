output "db_id" {
  value       = aws_db_instance.database.id
  description = "RDS Database ID"
}

output "db_url" {
  value       = aws_db_instance.database.address
  description = "RDS Database URL"
}

output "db_username" {
  value       = aws_db_instance.database.username
  description = "RDS Database admin account user"
}
