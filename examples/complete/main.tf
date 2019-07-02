provider "aws" {
  region = var.region
}

module "ssm_tls_ssh_key_pair" {
  source               = "../../"
  namespace            = var.namespace
  stage                = var.stage
  name                 = var.name
  ssm_path_prefix      = var.ssm_path_prefix
  ssh_key_algorithm    = var.ssh_key_algorithm
  ssh_private_key_name = var.ssh_private_key_name
  ssh_public_key_name  = var.ssh_public_key_name
}
