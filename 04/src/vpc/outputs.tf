output "net" {
  value       = module.vpc_dev.net
  description = "yandex_vpc_network"
}

output "subnets" {
  value       = module.vpc_dev.subnets
  description = "yandex_vpc_subnet[]"
}
