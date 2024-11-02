<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.9.3 |
| <a name="requirement_sakuracloud"></a> [sakuracloud](#requirement\_sakuracloud) | 2.25.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_sakuracloud"></a> [sakuracloud](#provider\_sakuracloud) | 2.25.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [sakuracloud_disk.main](https://registry.terraform.io/providers/sacloud/sakuracloud/2.25.4/docs/resources/disk) | resource |
| [sakuracloud_note.netplan_setup](https://registry.terraform.io/providers/sacloud/sakuracloud/2.25.4/docs/resources/note) | resource |
| [sakuracloud_server.main](https://registry.terraform.io/providers/sacloud/sakuracloud/2.25.4/docs/resources/server) | resource |
| [sakuracloud_archive.ubuntu](https://registry.terraform.io/providers/sacloud/sakuracloud/2.25.4/docs/data-sources/archive) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_core"></a> [core](#input\_core) | server core number(vCPU) | `number` | `"1"` | no |
| <a name="input_description"></a> [description](#input\_description) | description of the server | `string` | `""` | no |
| <a name="input_disk_resource_id"></a> [disk\_resource\_id](#input\_disk\_resource\_id) | Ubuntu Server 24.04.1 LTS 64bitの固定リソースID | `string` | `"113601947035"` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | disk size | `number` | `"20"` | no |
| <a name="input_env"></a> [env](#input\_env) | 環境名 | `string` | `"dev"` | no |
| <a name="input_filter_id"></a> [filter\_id](#input\_filter\_id) | server of packet filter rules | `string` | n/a | yes |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | gateway of server | `string` | n/a | yes |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | sakura server hostname | `string` | `""` | no |
| <a name="input_local_gateway"></a> [local\_gateway](#input\_local\_gateway) | local gateway address | `string` | n/a | yes |
| <a name="input_local_netmask"></a> [local\_netmask](#input\_local\_netmask) | private ip of local netmask | `number` | `24` | no |
| <a name="input_local_private_ip"></a> [local\_private\_ip](#input\_local\_private\_ip) | private ip of local network | `string` | n/a | yes |
| <a name="input_local_sw_id"></a> [local\_sw\_id](#input\_local\_sw\_id) | swich id of nfs | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | server memory size(GB) | `number` | `"1"` | no |
| <a name="input_netmask"></a> [netmask](#input\_netmask) | router's netmask | `number` | `28` | no |
| <a name="input_os"></a> [os](#input\_os) | os type(default:Ubuntu latest) | `string` | `"ubuntu"` | no |
| <a name="input_password"></a> [password](#input\_password) | root password | `string` | n/a | yes |
| <a name="input_private_filter_id"></a> [private\_filter\_id](#input\_private\_filter\_id) | server of packet filter rules | `string` | n/a | yes |
| <a name="input_private_ip"></a> [private\_ip](#input\_private\_ip) | private ip of server | `string` | `""` | no |
| <a name="input_service"></a> [service](#input\_service) | サービス名 | `string` | `"sample"` | no |
| <a name="input_ssh_key_ids"></a> [ssh\_key\_ids](#input\_ssh\_key\_ids) | ssh key ids | `list(string)` | n/a | yes |
| <a name="input_suffix"></a> [suffix](#input\_suffix) | server suffix | `string` | `"srv"` | no |
| <a name="input_switch_id"></a> [switch\_id](#input\_switch\_id) | sakura switch id | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | タグ（サーバーグループとしても利用する） | `list(string)` | `[]` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | zone time(default:石狩第2) | `string` | `"is1b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_disk_id"></a> [disk\_id](#output\_disk\_id) | n/a |
| <a name="output_ip_address"></a> [ip\_address](#output\_ip\_address) | n/a |
| <a name="output_name"></a> [name](#output\_name) | n/a |
<!-- END_TF_DOCS -->