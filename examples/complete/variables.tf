variable "region" {
  type        = string
  description = "AWS Region"
}

variable "ssh_public_key_name" {
  type        = string
  description = "SSM Parameter name of the SSH public key"
}

variable "ssh_private_key_name" {
  type        = string
  description = "SSM Parameter name of the SSH private key"
}

variable "ssh_key_algorithm" {
  type        = string
  description = "SSH key algorithm to use. Currently-supported values are 'RSA' and 'ECDSA'"
}

variable "ssm_path_prefix" {
  type        = string
  description = "The SSM parameter path prefix"
}
