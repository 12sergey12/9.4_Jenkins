#resource "yandex_compute_disk" "stor" {
#  count   = 3
#  name    = "disk-${count.index + 1}"
#  size    = 1
#}


resource "yandex_compute_instance" "clickhouse-01" {
  name = "clickhouse-01"
  resources {
    cores         = 2
    memory        = 4
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = "fd8933lf2cg088htd8sb"
    }
  }

#  dynamic "secondary_disk" {
#   for_each = "${yandex_compute_disk.stor.*.id}"
#   content {
#     disk_id = yandex_compute_disk.stor["${secondary_disk.key}"].id
#   }
#  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
