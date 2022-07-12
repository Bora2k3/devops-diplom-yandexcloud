output "vm_db01_private" {
  value       = yandex_compute_instance.db01.network_interface.0.ip_address
  description = "Private IP addresses on vm_db01"
}

output "vm_db02_private" {
  value       = yandex_compute_instance.db02.network_interface.0.ip_address
  description = "Private IP addresses on vm_db02"
}

output "vm_app_private" {
  value       = yandex_compute_instance.app.network_interface.0.ip_address
  description = "Private IP addresses on vm_app"
}

output "vm_gitlab_private" {
  value       = yandex_compute_instance.gitlab.network_interface.0.ip_address
  description = "Private IP addresses on vm_gitlab"
}

output "vm_runner_private" {
  value       = yandex_compute_instance.runner.network_interface.0.ip_address
  description = "Private IP addresses on vm_runner"
}

output "vm_monitoring_private" {
  value       = yandex_compute_instance.monitoring.network_interface.0.ip_address
  description = "Private IP addresses on vm_monitoring"
}

output "vm_proxy_public_ip" {
  description = "Public IP addresses on vm_proxy"
  value = yandex_compute_instance.revproxy.network_interface.0.nat_ip_address
}

output "vm_proxy_private" {
  value       = yandex_compute_instance.revproxy.network_interface.0.ip_address
  description = "Private IP addresses on vm_proxy"
}

