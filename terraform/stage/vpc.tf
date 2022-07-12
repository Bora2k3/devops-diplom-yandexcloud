resource "yandex_vpc_network" "podkovka-netology-vpc" {
  name                    = "podkovka-netology-vpc"
}

resource "yandex_vpc_route_table" "nat-instance-route" {
  name                    = "nat-instance-route"
  network_id              = yandex_vpc_network.podkovka-netology-vpc.id
  static_route {
    destination_prefix    = "0.0.0.0/0"
    next_hop_address      = var.revproxy_ip
  }
}

resource "yandex_vpc_subnet" "subnet" {
  count                   = 3
  name                    = "subnet-${var.zones[count.index]}"
  zone                    = var.zones[count.index]
  network_id              = yandex_vpc_network.podkovka-netology-vpc.id
  v4_cidr_blocks          = [var.cidr[count.index]]
  route_table_id          = yandex_vpc_route_table.nat-instance-route.id
}