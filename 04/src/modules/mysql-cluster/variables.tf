variable "name" {
  type = string
}

variable "zone" {
  type = string
}

variable "network_id" {
  type = string
}

variable "ha" {
  type    = bool
  default = true
}

variable "hosts_count" {
  type = number
  default = 2
}

variable "environment" {
  type    = string
  default = "PRESTABLE"
}

variable "mysql_version" {
  type    = string
  default = "8.0"
}

variable "resource_preset_id" {
  type    = string
  default = "b2.medium"
}

variable "disk_type_id" {
  type    = string
  default = "network-hdd"
}

variable "disk_size" {
  type    = number
  default = 10
}
