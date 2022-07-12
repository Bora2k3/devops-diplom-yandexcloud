zones = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
cidr = ["192.168.10.0/24", "192.168.20.0/24", "192.168.30.0/24"]
name = ["db01", "db02", "app", "gitlab", "runner", "monitoring"]
hostname = ["db01.podkovka.ru.net", "db02.podkovka.ru.net", "gitlab.podkovka.ru.net", "app.podkovka.ru.net", "runner.podkovka.ru.net", "monitoring.podkovka.ru.net"]
cloudflare_zone_id = "ab9d61cb299880d987fa2cb3ca8cf067"
sub_domain = ["@", "www", "gitlab", "grafana", "prometheus", "alertmanager"]
revproxy_ip = "192.168.10.100"