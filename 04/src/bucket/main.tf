resource "yandex_iam_service_account" "service_account" {
  name        = var.s3_tfstate_account
  description = "Service account for Terraform tfstate"
}

resource "yandex_resourcemanager_folder_iam_member" "storage_editor" {
  folder_id = var.folder_id
  role      = "storage.editor"
  member    = "serviceAccount:${yandex_iam_service_account.service_account.id}"
}

resource "yandex_iam_service_account_static_access_key" "static_access_key" {
  service_account_id = yandex_iam_service_account.service_account.id
  description        = "Static access key for Terraform state bucket"
}

resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

resource "yandex_storage_bucket" "bucket" {
  folder_id = var.folder_id

  bucket   = "${var.s3_bucket_name}-${random_string.unique_id.result}"
  max_size = var.s3_bucket_size

  versioning {
    enabled = true
  }

  depends_on = [
    yandex_resourcemanager_folder_iam_member.storage_editor
  ]
}
