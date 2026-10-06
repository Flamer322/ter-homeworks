module "mysql_cluster_example" {
  source = "./modules/mysql-cluster"

  name       = var.mysql_cluster_name
  zone       = var.mysql_cluster_zone
  network_id = module.vpc_dev.net.id
  ha         = var.mysql_cluster_ha
}

module "mysql_db_user_test" {
  source = "./modules/mysql-db-user"

  cluster_id    = module.mysql_cluster_example.cluster.id
  database_name = var.mysql_database_name
  user_name     = var.mysql_user_name
  user_password = var.mysql_user_password
}
