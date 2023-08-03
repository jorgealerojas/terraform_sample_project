output "vpc_id" {
    description = "VPC ID"
    value       = module.vpc.vpc_id
}

output "vpc_public_subnets_id" {
  description = "IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "vpc_database_subnets_id" {
  description = "IDs of database subnets"
  value       = module.vpc.database_subnets
}

output "vpc_frontend_subnets_id" {
  description = "IDs of frontend subnets"
  value       = module.vpc.private_subnets
}

output "vpc_backend_subnets_id" {
  description = "IDs of frontend subnets"
  value       = module.vpc.private_subnets
}