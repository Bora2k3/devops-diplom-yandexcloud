variable "zones" {
  type    = list(string)
  description = "List Yandex Cloud zones"
}

variable "cidr" {
  type    = list(string)
  description = "List supernetting"
}

variable "name" {
  type = list(string)
  description = "List domains"
}

variable "hostname" {
  type = list(string)
  description = "List hostnames"
}

variable "cloudflare_zone_id" {
  description = "ID Cloudflare zone"
}

variable "sub_domain" {
  type    = list(string)
  description = "List subdomains"
}

variable "revproxy_ip" {
  description = "Reversy Proxy internal IP"
}