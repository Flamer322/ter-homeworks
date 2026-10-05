# cloud vars

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
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
