terraform {
  required_providers {
    yandex-cloud/yandex = {
      source  = "local/hashicorp/yandex"
      version = ">= 0.98.0"
    }
  }
  required_version = ">= 0.13"
}