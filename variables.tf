variable "namespace" {
  type        = "string"
  description = "Namespace (e.g. `cp` or `cloudposse`)"
}

variable "stage" {
  type        = "string"
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
}

variable "name" {
  type        = "string"
  description = "Application or solution name (e.g. `app`)"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `namespace`, `stage`, `name` and `attributes`"
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. map(`BusinessUnit`,`XYZ`)"
}

variable "ssh_public_key_name" {
  type        = "string"
  description = "SSM Parameter name of the SSH public key"
  default = "ssh_public_key"
}

variable "ssh_private_key_name" {
  type        = "string"
  description = "SSM Parameter name of the SSH private key"
  default = "ssh_private_key"
}

variable "ssh_key_algorithm" {
  type        = "string"
  default     = "RSA"
  description = "SSH key algorithm"
}
