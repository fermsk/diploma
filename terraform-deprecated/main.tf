terraform {
  required_providers {
    yandex = {
      source = "local/hashicorp/yandex"
    }
  }
  required_version = ">= 0.98"
}

provider "yandex" {
  zone = "ru-central1-a"
}
resource "yandex_compute_instance" "vm-1" {
  name = "node"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8d8etig5vu92nh75bm"
      size = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }
# metadata = {
#     ssh-keys = "${file("~/.ssh/id_rsa.pub")}"
#   }
}

# resource "yandex_compute_instance" "vm-2" {
#   name = "work-node1"
#
#   resources {
#     cores  = 2
#     memory = 2
#   }
#
#   boot_disk {
#     initialize_params {
#       image_id = "fd8d8etig5vu92nh75bm"
#       size = 20
#     }
#   }
#
#   network_interface {
#     subnet_id = yandex_vpc_subnet.subnet-1.id
#     nat       = true
#   }
# metadata = {
#     ssh-keys = "${file("~/.ssh/id_rsa.pub")}"
#   }
# }

# resource "yandex_compute_instance" "vm-3" {
#   name = "work-node2"
#
#   resources {
#     cores  = 2
#     memory = 2
#   }
#
#   boot_disk {
#     initialize_params {
#       image_id = "fd8d8etig5vu92nh75bm"
#       size = 20
#     }
#   }
#
#   network_interface {
#     subnet_id = yandex_vpc_subnet.subnet-1.id
#     nat       = true
#   }
# metadata = {
#     ssh-keys = "${file("~/.ssh/id_rsa.pub")}"
#   }
# }
#
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["10.127.0.0/24"]
}
#
# resource "yandex_vpc_subnet" "subnet-2" {
#   name           = "subnet2"
#   zone           = "ru-central1-b"
#   network_id     = yandex_vpc_network.network-1.id
#   v4_cidr_blocks = ["10.129.0.0/24"]
# }
#
# resource "yandex_vpc_subnet" "subnet-3" {
#   name           = "subnet3"
#   zone           = "ru-central1-c"
#   network_id     = yandex_vpc_network.network-1.id
#   v4_cidr_blocks = ["10.130.0.0/24"]
# }

# output "internal_ip_address_vm_1" {
#   value = yandex_compute_instance.vm-1.network_interface.0.ip_address
# }
#
# output "internal_ip_address_vm_2" {
#   value = yandex_compute_instance.vm-2.network_interface.0.ip_address
# }
#
# output "internal_ip_address_vm_3" {
#   value = yandex_compute_instance.vm-3.network_interface.0.ip_address
# }

#output "external_ip_address_vm_1" {
#  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
#}

# output "external_ip_address_vm_2" {
#   value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
# }
#
# output "external_ip_address_vm_3" {
#   value = yandex_compute_instance.vm-3.network_interface.0.nat_ip_address
# }