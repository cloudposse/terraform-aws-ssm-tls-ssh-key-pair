output "public_key" {
  value       = "${join("", tls_private_key.default.*.public_key_openssh)}"
  description = "Contents of the generated public key"
}
