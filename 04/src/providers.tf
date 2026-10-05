terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }

    aws = {
      source  = "hashicorp/aws"
    }

    random = {
      source  = "hashicorp/random"
    }
  }

  required_version = "~>1.16.0"
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
