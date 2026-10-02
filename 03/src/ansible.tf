resource "terraform_data" "ansible" {
  depends_on = [
    local_file.hosts_templatefile,
    yandex_compute_instance.count_vm,
    yandex_compute_instance.each_vm,
    yandex_compute_instance.storage_vm,
  ]

  provisioner "local-exec" {
    command = <<-EOT
      eval $(ssh-agent)
      cat ${var.vms_ssh_key_file} | ssh-add -

      ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook \
        -i ${abspath(path.module)}/hosts.ini \
        ${abspath(path.module)}/playbook.yaml
    EOT

    on_failure = continue
  }

  triggers_replace = {
    always_run = "${timestamp()}"
  }
}
