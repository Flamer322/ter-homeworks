resource "yandex_compute_instance" "count_vm" {
  count = 2

  name        = "netology-platform-develop-count-vm-${count.index}"
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
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = var.vm_resources.nat
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.vms_metadata
}
