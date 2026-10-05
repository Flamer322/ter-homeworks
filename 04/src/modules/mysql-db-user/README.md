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
| [yandex_mdb_mysql_database.database](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_database) | resource |
| [yandex_mdb_mysql_user.user](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_mysql_user) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | n/a | `string` | n/a | yes |
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | n/a | `string` | n/a | yes |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | n/a | `string` | n/a | yes |
| <a name="input_user_password"></a> [user\_password](#input\_user\_password) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
