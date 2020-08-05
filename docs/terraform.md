## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0, < 0.14.0 |
| aws | ~> 2.0 |
| local | ~> 1.3 |
| null | ~> 2.1 |
| tls | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| tls | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| ecdsa\_curve | When ssh\_key\_algorithm is 'ECDSA', the name of the elliptic curve to use. May be any one of 'P256', 'P384' or P521' | `string` | `"P256"` | no |
| enabled | Whether to create the resources. Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| kms\_key\_id | KMS Key ID used for encryption | `string` | `""` | no |
| name | Application or solution name (e.g. `app`) | `string` | n/a | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | `string` | `""` | no |
| overwrite\_ssm\_parameter | Whether to overwrite an existing SSM parameter | `bool` | `true` | no |
| rsa\_bits | When ssh\_key\_algorithm is 'RSA', the size of the generated RSA key in bits | `number` | `4096` | no |
| ssh\_key\_algorithm | SSH key algorithm to use. Currently-supported values are 'RSA' and 'ECDSA' | `string` | `"RSA"` | no |
| ssh\_private\_key\_name | SSM Parameter name of the SSH private key | `string` | `""` | no |
| ssh\_public\_key\_name | SSM Parameter name of the SSH public key | `string` | `""` | no |
| ssm\_path\_format | SSM path format | `string` | `"/%s/%s"` | no |
| ssm\_path\_prefix | The SSM parameter path prefix (e.g. /$ssm\_path\_prefix/$key\_name) | `string` | `"ssh_keys"` | no |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | `string` | `""` | no |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| key\_name | Name of SSH key |
| public\_key | Content of the generated public key |
| ssh\_private\_key\_ssm\_path | SSM path of the generated private key |
| ssh\_public\_key\_ssm\_path | SSM path of the generated public key |

