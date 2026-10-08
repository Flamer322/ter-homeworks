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
