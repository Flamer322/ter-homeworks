resource "yandex_vpc_security_group" "mysql_cluster_sg" {
  name       = "${var.mysql_cluster_name}-sg"
  network_id = module.vpc_dev.net.id

  ingress {
    protocol       = "TCP"
    description    = "MySQL"
    port           = 3306
    v4_cidr_blocks = flatten([for subnet in module.vpc_dev.subnets : subnet.v4_cidr_blocks])
  }
}

module "mysql_cluster_example" {
  source = "./modules/mysql-cluster"

  name              = var.mysql_cluster_name
  zone              = var.mysql_cluster_zone
  network_id        = module.vpc_dev.net.id
  security_group_id = yandex_vpc_security_group.mysql_cluster_sg.id
  ha                = var.mysql_cluster_ha
}

module "mysql_db_user_test" {
  source = "./modules/mysql-db-user"

  cluster_id    = module.mysql_cluster_example.cluster.id
  database_name = var.mysql_database_name
  user_name     = var.mysql_user_name
  user_password = var.mysql_user_password
}
