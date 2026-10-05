## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.8.4 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [yandex_mdb_mysql_cluster.cluster](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | n/a | `number` | `10` | no |
| <a name="input_disk_type_id"></a> [disk\_type\_id](#input\_disk\_type\_id) | n/a | `string` | `"network-hdd"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | n/a | `string` | `"PRESTABLE"` | no |
| <a name="input_ha"></a> [ha](#input\_ha) | n/a | `bool` | `true` | no |
| <a name="input_hosts_count"></a> [hosts\_count](#input\_hosts\_count) | n/a | `number` | `2` | no |
| <a name="input_mysql_version"></a> [mysql\_version](#input\_mysql\_version) | n/a | `string` | `"8.0"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | n/a | `string` | n/a | yes |
| <a name="input_resource_preset_id"></a> [resource\_preset\_id](#input\_resource\_preset\_id) | n/a | `string` | `"b2.medium"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_cluster"></a> [cluster](#output\_cluster) | yandex\_mdb\_mysql\_cluster |
