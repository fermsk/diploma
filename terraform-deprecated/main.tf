terraform {
  required_providers {
    yandex-cloud/yandex = {
      source = "local/hashicorp/yandex"
    }
  }
  required_version = ">= 0.98"
}

provider "yandex" {
  zone = "ru-central1-a"
}