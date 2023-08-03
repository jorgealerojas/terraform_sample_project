output "bastion_id" {
  description = "ID of the new Bastion host"
  value       = module.ec2_bastion.id
}