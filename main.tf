module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  attributes = "${var.attributes}"
  delimiter  = "${var.delimiter}"
  tags       = "${var.tags}"
}

locals {
  count            = "${var.enabled == "true" ? 1 : 0}"
  public_key_name  = "${length(var.ssh_public_key_name) > 0 ? var.ssh_public_key_name : module.label.id}}"
  private_key_name = "${length(var.ssh_private_key_name) > 0 ? var.ssh_private_key_name : module.label.id}"
}

resource "tls_private_key" "default" {
  count     = "${local.count}"
  algorithm = "${var.ssh_key_algorithm}"
}

resource "aws_ssm_parameter" "private_key" {
  count       = "${local.count}"
  name        = "${local.private_key_name}"
  description = "TLS Private Key"
  type        = "String"
  value       = "${tls_private_key.default.private_key_pem}"
  overwrite   = "true"
  depends_on  = ["tls_private_key.default"]
  tags        = "${module.label.tags}"
}

resource "aws_ssm_parameter" "public_key" {
  count       = "${local.count}"
  name        = "${local.public_key_name}"
  description = "TLS Public Key (OpenSSH)"
  type        = "String"
  value       = "${tls_private_key.default.public_key_openssh}"
  overwrite   = "true"
  depends_on = ["tls_private_key.default"]
  tags        = "${module.label.tags}"
}
