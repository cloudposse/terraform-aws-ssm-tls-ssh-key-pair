variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Application or solution name (e.g. `app`)"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "enabled" {
  type        = bool
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = true
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

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
