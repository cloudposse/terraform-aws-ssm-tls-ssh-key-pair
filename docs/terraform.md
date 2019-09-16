## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list(string) | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| ecdsa_curve | When ssh_key_algorithm is 'ECDSA', the name of the elliptic curve to use. May be any one of 'P256', 'P384' or P521' | string | `P256` | no |
| enabled | Whether to create the resources. Set to `false` to prevent the module from creating any resources | bool | `true` | no |
| kms_key_id | KMS Key ID used for encryption | string | `` | no |
| name | Application or solution name (e.g. `app`) | string | - | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | string | `` | no |
| overwrite_ssm_parameter | Whether to overwrite an existing SSM parameter | bool | `true` | no |
| rsa_bits | When ssh_key_algorithm is 'RSA', the size of the generated RSA key in bits | number | `4096` | no |
| ssh_key_algorithm | SSH key algorithm to use. Currently-supported values are 'RSA' and 'ECDSA' | string | `RSA` | no |
| ssh_private_key_name | SSM Parameter name of the SSH private key | string | `` | no |
| ssh_public_key_name | SSM Parameter name of the SSH public key | string | `` | no |
| ssm_path_format | SSM path format | string | `/%s/%s` | no |
| ssm_path_prefix | The SSM parameter path prefix (e.g. /$ssm_path_prefix/$key_name) | string | `ssh_keys` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | `` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map(string) | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| key_name | Name of SSH key |
| public_key | Content of the generated public key |
| ssh_private_key_ssm_path | SSM path of the generated private key |
| ssh_public_key_ssm_path | SSM path of the generated public key |

