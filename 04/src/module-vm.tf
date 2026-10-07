data "template_file" "cloudinit" {
  template = file("./cloud-init.yaml.tpl")
  vars = {
    ssh_public_key = file(var.vms_ssh_key_file)
  }
}

module "marketing_vm" {
  source        = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=de7090ae115ee5059cd81053a808af079c325e01"
  network_id    = module.vpc_dev.net.id
  subnet_zones  = [for subnet in module.vpc_dev.subnets : subnet.zone]
  subnet_ids    = [for subnet in module.vpc_dev.subnets : subnet.id]
  instance_name = "netology-module-vm-marketing"
  image_family  = var.vm_image_family
  public_ip     = true

  labels = {
    project = "marketing"
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }
}

module "analytics_vm" {
  source        = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=de7090ae115ee5059cd81053a808af079c325e01"
  network_id    = module.vpc_dev.net.id
  subnet_zones  = [for subnet in module.vpc_dev.subnets : subnet.zone]
  subnet_ids    = [for subnet in module.vpc_dev.subnets : subnet.id]
  instance_name = "netology-module-vm-analytics"
  image_family  = var.vm_image_family
  public_ip     = true

  labels = {
    project = "analytics"
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }
}
