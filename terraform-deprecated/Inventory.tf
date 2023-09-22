data  "template_file" "ansibl" {
  template = "${file("./ansibl.tpl")}"
  vars {
    master_ip = "${join("\n", yandex_compute_instance.vm-1.network_interface.0.nat_ip_address)}"
  }
}

resource "local_file" "k8s_file" {
  content  = "${data.template_file.ansibl.rendered}"
  filename = "./host"
}