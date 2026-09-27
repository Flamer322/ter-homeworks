resource "yandex_vpc_network" "develop" {
  name = var.vpc_net_name
}

resource "yandex_vpc_subnet" "develop_a" {
  name           = var.vpc_subnet_a_name
  zone           = var.vpc_zone_a
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vpc_zone_a_cidr
  route_table_id = yandex_vpc_route_table.route_table.id
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = var.vpc_subnet_b_name
  zone           = var.vpc_zone_b
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vpc_zone_b_cidr
  route_table_id = yandex_vpc_route_table.route_table.id
}

resource "yandex_vpc_gateway" "nat_gateway" {
  name = var.vpc_gateway_name
  shared_egress_gateway {}
}

resource "yandex_vpc_route_table" "route_table" {
  name       = var.vpc_route_table_name
  network_id = yandex_vpc_network.develop.id

  static_route {
    destination_prefix = "0.0.0.0/0"
    gateway_id         = yandex_vpc_gateway.nat_gateway.id
  }
}

data "yandex_compute_image" "ubuntu" {
  family = var.vms_image_family
}

resource "yandex_compute_instance" "web" {
  name        = local.vm_web_name
  platform_id = var.vms_resources.web.platform_id
  zone        = var.vpc_zone_a

  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vms_resources.web.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_a.id
    nat       = var.vms_resources.web.nat
  }

  metadata = local.vms_metadata
}

resource "yandex_compute_instance" "db" {
  name        = local.vm_db_name
  platform_id = var.vms_resources.db.platform_id
  zone        = var.vpc_zone_b

  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vms_resources.db.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop_b.id
    nat       = var.vms_resources.db.nat
  }

  metadata = local.vms_metadata
}
