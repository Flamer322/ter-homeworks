output "net" {
  value       = yandex_vpc_network.net
  description = "yandex_vpc_network"
}

output "subnets" {
  value       = values(yandex_vpc_subnet.subnets)
  description = "yandex_vpc_subnet[]"
}
