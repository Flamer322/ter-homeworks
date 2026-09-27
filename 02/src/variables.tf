# project vars

variable "env" {
  type    = string
  default = "develop"
}

variable "project" {
  type    = string
  default = "netology-platform"
}

# cloud vars

variable "cloud_id" {
  type        = string
  default     = "b1g5hvs35p13c6j5mdgc"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g46m848182hv5f2t99"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

# network vars

variable "vpc_net_name" {
  type        = string
  default     = "develop-net"
  description = "VPC network name"
}

variable "vpc_subnet_a_name" {
  type        = string
  default     = "develop-a-subnet"
  description = "VPC subnet-a name"
}

variable "vpc_subnet_b_name" {
  type        = string
  default     = "develop-b-subnet"
  description = "VPC subnet-b name"
}

variable "vpc_zone_a" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_zone_a_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_zone_b_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_gateway_name" {
  type        = string
  default     = "develop-gateway"
  description = "VPC NAT gateway name"
}

variable "vpc_route_table_name" {
  type        = string
  default     = "develop-route-table"
  description = "VPC NAT route table name"
}

# ssh vars

variable "vms_ssh_name" {
  type    = string
  default = "ubuntu"
}

variable "vms_ssh_key_file" {
  type        = string
  default     = "~/.ssh/yandex-cloud-bba11enev-economy-toolbox.pub"
  description = "ssh-keygen -t ed25519"
  sensitive   = true
}

# test var

variable "test" {
  type = list(
    map(
      list(string)
    )
  )
}
