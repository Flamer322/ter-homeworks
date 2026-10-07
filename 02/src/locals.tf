locals {
  vm_web_name = "${var.project}-${var.env}-web"
  vm_db_name  = "${var.project}-${var.env}-db"
  vms_metadata = {
    serial-port-enable = 1
    ssh-keys           = "${var.vms_ssh_name}:${var.vms_ssh_key}"
  }
}
