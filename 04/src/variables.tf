# cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "subnets" {
  type = list(
    object({
      zone = string
      cidr = string
    })
  )
  default = [
    { zone = "ru-central1-a", cidr = "10.0.1.0/24" },
  ]
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "mysql_cluster_name" {
  type        = string
  default     = "example"
  description = "MYSQL cluster name"
}

variable "mysql_cluster_zone" {
  type    = string
  default = "ru-central1-a"
}

variable "mysql_cluster_ha" {
  type    = bool
  default = true
}

variable "mysql_database_name" {
  type    = string
  default = "test"
}

variable "mysql_user_name" {
  type    = string
  default = "app"
}

variable "mysql_user_password" {
  type      = string
  default   = "password"
  sensitive = true
}

variable "s3_bucket_name" {
  type    = string
  default = "develop-bucket"
}

variable "s3_bucket_size" {
  type    = number
  default = 1073741824
}

variable "vault_address" {
  type    = string
  default = "http://127.0.0.1:8200"
}

variable "vault_token" {
  type    = string
  default = "education"
}

# common vars

variable "vms_ssh_key_file" {
  type        = string
  default     = "~/.ssh/yandex-cloud-bba11enev-economy-toolbox.pub"
  description = "ssh-keygen -t ed25519"
  sensitive   = true
}

# vm vars

variable "vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "VM image family name"
}

# test vars

variable "test_ip_address" {
  type        = string
  description = "ip-адрес"

  default = "192.168.0.1"
  # default = "1920.1680.0.1"

  validation {
    condition     = can(cidrhost("${var.test_ip_address}/32", 0))
    error_message = "test_ip_address must be a valid IPv4 address."
  }
}

variable "test_ip_address_list" {
  type        = list(string)
  description = "список ip-адресов"

  default = ["192.168.0.1", "1.1.1.1", "127.0.0.1"]
  # default = ["192.168.0.1", "1.1.1.1", "1270.0.0.1"]

  validation {
    condition = alltrue([
      for ip_address in var.test_ip_address_list :
      can(cidrhost("${ip_address}/32", 0))
    ])

    error_message = "All test_ip_address_list values must be a valid IPv4 addresses."
  }
}

variable "test_no_uppercase" {
  type        = string
  description = "любая строка"

  default = "любая строка"
  # default = "ЛЮБАЯ строка"

  validation {
    condition     = var.test_no_uppercase == lower(var.test_no_uppercase)
    error_message = "test_no_uppercase must not contain uppercase values."
  }
}

variable "in_the_end_there_can_be_only_one" {
  description = "Who is better Connor or Duncan?"
  type        = object({ Dunkan = optional(bool), Connor = optional(bool) })

  default = { Dunkan = true, Connor = false }
  # default = {  Dunkan = false, Connor = true }
  # default = {  Dunkan = true, Connor = true }
  # default = {  Dunkan = false, Connor = false }

  validation {
    condition     = var.in_the_end_there_can_be_only_one.Dunkan != var.in_the_end_there_can_be_only_one.Connor
    error_message = "There can be only one MacLeod"
  }
}
