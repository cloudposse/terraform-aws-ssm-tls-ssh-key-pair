output "public_key" {
  value       = local.rsa ? join("", tls_private_key.default_rsa.*.public_key_openssh) : join("", tls_private_key.default_ecdsa.*.public_key_openssh)
  description = "Content of the generated public key"
}

output "key_name" {
  value       = module.label.id
  description = "Name of SSH key"
}
