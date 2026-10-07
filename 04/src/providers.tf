terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.9"
    }

    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.1"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.5"
    }

    template = {
      source  = "hashicorp/template"
      version = ">= 2.2"
    }

    vault = {
      source  = "hashicorp/vault"
      version = ">= 5.0"
    }
  }

  required_version = "~>1.16.0"

  backend "s3" {
    profile = "default"

    bucket = "develop-bucket-abdtsxh4"
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
}

provider "yandex" {
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("~/.authorized_key.json")
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}

provider "vault" {
  address         = var.vault_address
  skip_tls_verify = true
  token           = var.vault_token
}
