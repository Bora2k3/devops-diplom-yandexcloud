resource "cloudflare_record" "domains" {
  count   = 6
  name    = var.sub_domain[count.index]
  type    = "A"
  zone_id = var.cloudflare_zone_id
  value     = "${yandex_compute_instance.revproxy.network_interface.0.nat_ip_address}"
  proxied   = false
}