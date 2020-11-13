output "public_key" {
  value       = local.rsa ? join("", tls_private_key.default_rsa.*.public_key_openssh) : join("", tls_private_key.default_ecdsa.*.public_key_openssh)
  description = "Content of the generated public key"
}

output "key_name" {
  value       = module.this.id
  description = "Name of SSH key"
}

output "ssh_public_key_ssm_path" {
  value       = local.ssh_public_key_ssm_path
  description = "SSM path of the generated public key"
}

output "ssh_private_key_ssm_path" {
  value       = local.ssh_private_key_ssm_path
  description = "SSM path of the generated private key"
}
