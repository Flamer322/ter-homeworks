###cloud vars

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

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

# vm vars

variable "vm_image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "vm_resources" {
  type = map(any)
  default = {
    platform_id   = "standard-v2"
    cores         = 2
    memory        = 1
    core_fraction = 5
    preemptible   = true
    nat           = true
  }
}

variable "disk_resources" {
  type = map(any)
  default = {
    type = "network-hdd"
    size = 1
  }
}

# ssh vars

variable "vms_ssh_name" {
  type    = string
  default = "ubuntu"
}

variable "vms_ssh_key_file" {
  type        = string
  default     = "~/.ssh/yandex-cloud-bba11enev-economy-toolbox"
  description = "ssh-keygen -t ed25519"
  sensitive   = false
}
