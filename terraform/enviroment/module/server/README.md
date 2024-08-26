<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_sakuracloud"></a> [sakuracloud](#provider\_sakuracloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [sakuracloud_disk.main](https://registry.terraform.io/providers/hashicorp/sakuracloud/latest/docs/resources/disk) | resource |
| [sakuracloud_server.main](https://registry.terraform.io/providers/hashicorp/sakuracloud/latest/docs/resources/server) | resource |
| [sakuracloud_archive.ubuntu](https://registry.terraform.io/providers/hashicorp/sakuracloud/latest/docs/data-sources/archive) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_core"></a> [core](#input\_core) | server core number(vCPU) | `number` | `"1"` | no |
| <a name="input_description"></a> [description](#input\_description) | description of the server | `string` | `""` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | disk size | `number` | `"20"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | sakura server hostname | `string` | `""` | no |
| <a name="input_os"></a> [os](#input\_os) | os type(default:Ubuntu latest) | `string` | `"ubuntu"` | no |
| <a name="input_password"></a> [password](#input\_password) | root password | `string` | n/a | yes |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | private ip of server (unused) | `string` | `""` | no |
| <a name="input_ram"></a> [ram](#input\_ram) | server core number(GB) | `number` | `"1"` | no |
| <a name="input_ssh_key_ids"></a> [ssh\_key\_ids](#input\_ssh\_key\_ids) | ssh key ids | `list(string)` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | server suffix | `string` | `"srv"` | no |
| <a name="input_switch_id"></a> [switch\_id](#input\_switch\_id) | sakura switch id (unused) | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | zone time(default:石狩第2) | `string` | `"is1b"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->