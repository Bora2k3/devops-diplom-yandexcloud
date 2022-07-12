terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "s3-podkovka-devops-netology"
    region     = "ru-central1"
    key        = "terraform/terraform.tfstate"
    # access_key pulled from $YC_STORAGE_ACCESS_KEY
    # secret_key pulled from $YC_STORAGE_SECRET_KEY
    skip_region_validation      = true
    skip_credentials_validation = true
  }
}