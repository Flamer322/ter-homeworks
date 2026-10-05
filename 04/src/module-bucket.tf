resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

module "s3" {
  source = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git?ref=master"

  bucket_name = "${var.s3_bucket_name}-${random_string.unique_id.result}"
  max_size    = var.s3_bucket_size
}
