module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.16.0"
  enabled    = var.enabled
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  attributes = var.attributes
  delimiter  = var.delimiter
  tags       = var.tags
}

locals {
  remapped_label_id        = replace(module.label.id, var.delimiter, "_")
  rsa                      = var.ssh_key_algorithm == "RSA" ? true : false
  ecdsa                    = var.ssh_key_algorithm == "ECDSA" ? true : false
  default_public_key_name  = "${local.remapped_label_id}_public_key"
  default_private_key_name = "${local.remapped_label_id}_private_key"
  public_key_name          = length(var.ssh_public_key_name) > 0 ? var.ssh_public_key_name : local.default_public_key_name
  private_key_name         = length(var.ssh_private_key_name) > 0 ? var.ssh_private_key_name : local.default_private_key_name

  ssh_public_key_ssm_path = format(
    var.ssm_path_format,
    var.ssm_path_prefix,
    local.public_key_name
  )

  ssh_private_key_ssm_path = format(
    var.ssm_path_format,
    var.ssm_path_prefix,
    local.private_key_name
  )

  kms_key_id = length(var.kms_key_id) > 0 ? var.kms_key_id : format("alias/%s-%s-chamber", var.namespace, var.stage)
}

data "aws_kms_key" "kms_key" {
  count  = var.enabled ? 1 : 0
  key_id = local.kms_key_id
}

resource "tls_private_key" "default_rsa" {
  count     = var.enabled && local.rsa ? 1 : 0
  algorithm = var.ssh_key_algorithm
  rsa_bits  = var.rsa_bits
}

resource "tls_private_key" "default_ecdsa" {
  count       = var.enabled && local.ecdsa ? 1 : 0
  algorithm   = var.ssh_key_algorithm
  ecdsa_curve = var.ecdsa_curve
}

resource "aws_ssm_parameter" "private_rsa_key" {
  count       = var.enabled && local.rsa ? 1 : 0
  name        = local.ssh_private_key_ssm_path
  description = "TLS Private Key"
  type        = "SecureString"
  key_id      = join("", data.aws_kms_key.kms_key.*.id)
  value       = join("", tls_private_key.default_rsa.*.private_key_pem)
  overwrite   = var.overwrite_ssm_parameter
  depends_on  = [tls_private_key.default_rsa]
  tags        = module.label.tags
}

resource "aws_ssm_parameter" "public_rsa_key" {
  count       = var.enabled && local.rsa ? 1 : 0
  name        = local.ssh_public_key_ssm_path
  description = "TLS Public Key (OpenSSH - ${var.ssh_key_algorithm})"
  type        = "String"
  value       = join("", tls_private_key.default_rsa.*.public_key_openssh)
  overwrite   = var.overwrite_ssm_parameter
  depends_on  = [tls_private_key.default_rsa]
  tags        = module.label.tags
}

resource "aws_ssm_parameter" "private_ecdsa_key" {
  count       = var.enabled && local.ecdsa ? 1 : 0
  name        = local.ssh_private_key_ssm_path
  description = "TLS Private Key (${var.ssh_key_algorithm})"
  type        = "SecureString"
  key_id      = join("", data.aws_kms_key.kms_key.*.id)
  value       = join("", tls_private_key.default_ecdsa.*.private_key_pem)
  overwrite   = var.overwrite_ssm_parameter
  depends_on  = [tls_private_key.default_ecdsa]
  tags        = module.label.tags
}

resource "aws_ssm_parameter" "public_ecdsa_key" {
  count       = var.enabled && local.ecdsa ? 1 : 0
  name        = local.ssh_public_key_ssm_path
  description = "TLS Public Key (${var.ssh_key_algorithm})"
  type        = "String"
  value       = join("", tls_private_key.default_ecdsa.*.public_key_openssh)
  overwrite   = var.overwrite_ssm_parameter
  depends_on  = [tls_private_key.default_ecdsa]
  tags        = module.label.tags
}
