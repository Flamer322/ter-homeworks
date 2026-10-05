resource "yandex_vpc_network" "net" {
  name = var.name
}

resource "yandex_vpc_subnet" "subnets" {
  for_each = { for subnet in var.subnets : subnet.zone => subnet.cidr }

  network_id = yandex_vpc_network.net.id

  name           = "${var.name}-${each.key}"
  zone           = each.key
  v4_cidr_blocks = [each.value]
}
