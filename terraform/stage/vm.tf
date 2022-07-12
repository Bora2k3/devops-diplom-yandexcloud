resource "yandex_compute_instance" "revproxy" {
  name     = "proxy"
  hostname = "podkovka.ru.net"
  zone     = var.zones[0]

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd84mnpg35f7s7b0f5lg" // nat-instance-ubuntu-1804-lts
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.subnet[0].id
    ip_address  = var.revproxy_ip
    nat         = true
    ipv6        = false
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

resource "yandex_compute_instance" "db01" {
  name     = "db01"
  hostname = "db01.podkovka.ru.net"
  zone     = var.zones[1]

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h34rub6pjpg4qgi8j" // ubuntu-1804-lts
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.subnet[1].id
    ipv6        = false
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

resource "yandex_compute_instance" "db02" {
  name     = "db02"
  hostname = "db02.podkovka.ru.net"
  zone     = var.zones[2]

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h34rub6pjpg4qgi8j" // ubuntu-1804-lts
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.subnet[2].id
    ipv6        = false
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

resource "yandex_compute_instance" "app" {
  name     = "app"
  hostname = "app.podkovka.ru.net"
  zone     = var.zones[0]

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h34rub6pjpg4qgi8j" // ubuntu-1804-lts
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.subnet[0].id
    ipv6        = false
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

resource "yandex_compute_instance" "gitlab" {
  name     = "gitlab"
  hostname = "gitlab.podkovka.ru.net"
  zone     = var.zones[1]

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h34rub6pjpg4qgi8j" // ubuntu-1804-lts
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.subnet[1].id
    ipv6        = false
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

resource "yandex_compute_instance" "runner" {
  name     = "runner"
  hostname = "runner.podkovka.ru.net"
  zone     = var.zones[2]

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h34rub6pjpg4qgi8j" // ubuntu-1804-lts
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.subnet[2].id
    ipv6        = false
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

resource "yandex_compute_instance" "monitoring" {
  name     = "monitoring"
  hostname = "monitoring.podkovka.ru.net"
  zone     = var.zones[0]

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd8h34rub6pjpg4qgi8j" // ubuntu-1804-lts
      type     = "network-hdd"
      size     = "10"
    }
  }

  network_interface {
    subnet_id   = yandex_vpc_subnet.subnet[0].id
    ipv6        = false
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}