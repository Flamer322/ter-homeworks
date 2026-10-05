variable "each_vm" {
  type = list(object({ vm_name = string, cpu = number, ram = number, disk_volume = number }))
  default = [
    {
      cpu         = 4
      ram         = 2
      disk_volume = 10
      vm_name     = "main"
    },
    {
      cpu         = 2
      ram         = 1
      disk_volume = 5
      vm_name     = "replica"
    },
  ]
}

resource "yandex_compute_instance" "each_vm" {
  for_each = { for vm in var.each_vm : vm.vm_name => vm }

  name        = each.value.vm_name
  platform_id = var.vm_resources.platform_id
  zone        = var.default_zone

  resources {
    cores         = each.value.cpu
    memory        = each.value.ram
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = each.value.disk_volume
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
