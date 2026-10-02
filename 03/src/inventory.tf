resource "local_file" "hosts_templatefile" {
  content = templatefile(
    "${path.module}/hosts.tftpl",
    {
      webservers = yandex_compute_instance.count_vm,
      databases = values(yandex_compute_instance.each_vm),
      storage = [yandex_compute_instance.storage_vm],
    }
  )

  filename = "${abspath(path.module)}/hosts.ini"
}
