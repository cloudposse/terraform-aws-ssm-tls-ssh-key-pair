variable "namespace" {
  type        = "string"
  description = "Namespace (e.g. `eg` or `cp`)"
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

variable "enabled" {
  type        = "string"
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = "true"
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
}

variable "ssh_private_key_name" {
  type        = "string"
  description = "SSM Parameter name of the SSH private key"
}

variable "ssh_key_algorithm" {
  type        = "string"
  description = "SSH key algorithm to use. Currently-supported values are 'RSA' and 'ECDSA'"
}

variable "ssm_path_prefix" {
  type        = "string"
  description = "The SSM parameter path prefix"
}

variable "region" {
  type        = "string"
  description = "AWS Region"
}
