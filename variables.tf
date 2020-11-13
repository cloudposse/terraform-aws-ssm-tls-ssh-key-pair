variable "overwrite_ssm_parameter" {
  type        = bool
  default     = true
  description = "Whether to overwrite an existing SSM parameter"
}

variable "ssm_path_format" {
  type        = string
  description = "SSM path format"
  default     = "/%s/%s"
}

variable "kms_key_id" {
  type        = string
  description = "KMS Key ID used for encryption"
  default     = ""
}

variable "ssh_public_key_name" {
  type        = string
  description = "SSM Parameter name of the SSH public key"
  default     = ""
}

variable "ssh_private_key_name" {
  type        = string
  description = "SSM Parameter name of the SSH private key"
  default     = ""
}

variable "ssh_key_algorithm" {
  type        = string
  default     = "RSA"
  description = "SSH key algorithm to use. Currently-supported values are 'RSA' and 'ECDSA'"
}

variable "rsa_bits" {
  type        = number
  default     = 4096
  description = "When ssh_key_algorithm is 'RSA', the size of the generated RSA key in bits"
}

variable "ecdsa_curve" {
  type        = string
  default     = "P256"
  description = "When ssh_key_algorithm is 'ECDSA', the name of the elliptic curve to use. May be any one of 'P256', 'P384' or P521'"
}

variable "ssm_path_prefix" {
  type        = string
  default     = "ssh_keys"
  description = "The SSM parameter path prefix (e.g. /$ssm_path_prefix/$key_name)"
}
