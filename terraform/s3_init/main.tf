terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.75.0"
    }
  }
}

provider "yandex" {
  # service_account_key_file pulled from $YC_SERVICE_ACCOUNT_KEY_FILE
  # cloud_id pulled from $YC_CLOUD_ID
  # folder_id pulled from $YC_FOLDER_ID
  zone      = "ru-central1-a"
}

resource "yandex_storage_bucket" "s3" {
  # access_key pulled from $YC_STORAGE_ACCESS_KEY
  # secret_key pulled from $YC_STORAGE_SECRET_KEY
  bucket = "s3-podkovka-devops-netology"
  force_destroy = true
}