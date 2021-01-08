provider "aws" {
  region = var.region
}

module "kms_key" {
  source  = "cloudposse/kms-key/aws"
  version = "0.9.0"

  description             = "Test KMS key"
  deletion_window_in_days = 7
  enable_key_rotation     = false

  context = module.this.context
}

module "ssm_tls_ssh_key_pair" {
  source               = "../../"
  kms_key_id           = module.kms_key.key_id
  ssm_path_prefix      = var.ssm_path_prefix
  ssh_key_algorithm    = var.ssh_key_algorithm
  ssh_private_key_name = var.ssh_private_key_name
  ssh_public_key_name  = var.ssh_public_key_name

  context = module.this.context
}
