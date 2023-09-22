output "master" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}


