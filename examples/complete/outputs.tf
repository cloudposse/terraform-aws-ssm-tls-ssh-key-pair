output "public_key" {
  value       = module.ssm_tls_ssh_key_pair.public_key
  description = "Content of the generated public key"
}

output "key_name" {
  value       = module.ssm_tls_ssh_key_pair.key_name
  description = "Name of SSH key"
}
