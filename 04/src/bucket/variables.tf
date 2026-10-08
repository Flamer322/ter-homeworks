# cloud vars

variable "token" {
  type        = string
  description = "https://yandex.cloud/ru/docs/iam/operations/iam-token/create"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "s3_tfstate_account" {
  type    = string
  default = "terraform-state"
}

variable "s3_bucket_name" {
  type    = string
  default = "develop-bucket"
}

variable "s3_bucket_size" {
  type    = number
  default = 1073741824
}
