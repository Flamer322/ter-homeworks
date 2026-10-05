resource "yandex_mdb_mysql_cluster" "cluster" {
  name        = var.name
  environment = var.environment
  network_id  = var.network_id
  version     = var.mysql_version

  resources {
    resource_preset_id = var.resource_preset_id
    disk_type_id       = var.disk_type_id
    disk_size          = var.disk_size
  }

  dynamic "host" {
    for_each = var.ha ? range(var.hosts_count) : [1]

    content {
      zone      = var.zone
      subnet_id = null
    }
  }
}
