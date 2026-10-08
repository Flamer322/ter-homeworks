output "bucket_name" {
  description = "tfstate bucket name"
  value       = yandex_storage_bucket.bucket.bucket
}

output "access_key_id" {
  description = "Static access key ID"
  value       = yandex_iam_service_account_static_access_key.static_access_key.access_key
  sensitive   = true
}

output "secret_key" {
  description = "Static secret access key"
  value       = yandex_iam_service_account_static_access_key.static_access_key.secret_key
  sensitive   = true
}

output "backend_configuration_example" {
  value     = <<EOT
  backend "s3" {
    profile = "default"

    bucket = "${yandex_storage_bucket.bucket.bucket}"
    key    = "terraform.tfstate"
    region = "ru-central1"

    use_lockfile = true

    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }

    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_s3_checksum            = true
  }
  EOT
  sensitive = true
}

output "aws_configuration_example" {
  value     = <<EOT
  [default]
  aws_access_key_id = ${yandex_iam_service_account_static_access_key.static_access_key.access_key}
  aws_secret_access_key = ${yandex_iam_service_account_static_access_key.static_access_key.secret_key}
  EOT
  sensitive = true
}
