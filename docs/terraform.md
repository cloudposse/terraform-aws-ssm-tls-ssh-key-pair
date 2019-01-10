
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| ecdsa_curve | When ssh_key_algorithm is 'ECDSA', the name of the elliptic curve to use. May be any one of 'P256', 'P384' or P521' | string | `P256` | no |
| enable_kms_key_rotation | Whether KMS key rotation is enabled | string | `true` | no |
| enabled | Whether to create the resources. Set to `false` to prevent the module from creating any resources | string | `true` | no |
| name | Application or solution name (e.g. `app`) | string | - | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | string | - | yes |
| overwrite_ssm_parameter | Whether to overwrite an existing SSM parameter | string | `true` | no |
| rsa_bits | When ssh_key_algorithm is 'RSA', the size of the generated RSA key in bits | string | `4096` | no |
| ssh_key_algorithm | SSH key algorithm to use. Currently-supported values are 'RSA' and 'ECDSA' | string | `RSA` | no |
| ssh_private_key_name | SSM Parameter name of the SSH private key | string | `` | no |
| ssh_public_key_name | SSM Parameter name of the SSH public key | string | `` | no |
| ssm_path_prefix | The SSM parameter path prefix (e.g. /$ssm_path_prefix/$key_name) | string | `ssh_keys` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| public_key | Contents of the generated public key |

