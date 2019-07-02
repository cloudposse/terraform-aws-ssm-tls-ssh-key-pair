output "ssh_public_key" {
  value       = module.ssm_tls_ssh_key_pair.public_key
  description = "Content of the generated public key"
}

output "ssh_key_name" {
  value       = module.ssm_tls_ssh_key_pair.key_name
  description = "Name of SSH key"
}

output "kms_key_arn" {
  value       = module.kms_key.key_arn
  description = "Key ARN"
}

output "kms_key_id" {
  value       = module.kms_key.key_id
  description = "Key ID"
}

output "kms_alias_arn" {
  value       = module.kms_key.alias_arn
  description = "Alias ARN"
}

output "kms_alias_name" {
  value       = module.kms_key.alias_name
  description = "Alias name"
}
