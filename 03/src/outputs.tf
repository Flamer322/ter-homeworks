output "vms_data" {
  description = "VMs data"
  value = [
    for vm in concat(yandex_compute_instance.count_vm, values(yandex_compute_instance.each_vm)) : {
      name = vm.name,
      id   = vm.id,
      fqdn = vm.fqdn,
    }
  ]
}
