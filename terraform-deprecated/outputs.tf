output "master" {
  value = <<-EOF
    [master]
    master ansible_host=${yandex_compute_instance.vm-1.network_interface.0.nat_ip_address} ansible_user=femsk
    EOF
}



