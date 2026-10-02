resource "yandex_compute_disk" "count_disk" {
  count = 2

  name = "netology-platform-develop-count-disk-${count.index}"

  type = var.disk_resources.type
  size = var.disk_resources.size
  zone = var.default_zone
}

resource "yandex_compute_instance" "storage_vm" {
  name        = "storage"
  platform_id = var.vm_resources.platform_id
  zone        = var.default_zone

  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }

  scheduling_policy {
    preemptible = var.vm_resources.preemptible
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_resources.nat
  }

  metadata = local.vms_metadata

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.count_disk

    content {
      disk_id = secondary_disk.value.id
    }
  }
}
