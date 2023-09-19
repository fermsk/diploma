terraform {
  required_providers {
   yandex = {
      source  = "local/hashicorp/yandex"
      version = ">= 0.98.0"
    }
  }

provider "yandex" {
  zone = "ru-central1-a"
}