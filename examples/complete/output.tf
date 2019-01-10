output "public_key" {
  value       = "${module.ssm_tls_ssh_key_pair.public_key}"
  description = "Contents of the generated public key"
}
