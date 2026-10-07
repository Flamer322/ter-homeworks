resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

module "s3" {
  source = "git::https://github.com/terraform-yc-modules/terraform-yc-s3.git?ref=791f53698dd13ee97bc1cbe51b765f2d10f1d273"

  bucket_name = "${var.s3_bucket_name}-${random_string.unique_id.result}"
  max_size    = var.s3_bucket_size
}
