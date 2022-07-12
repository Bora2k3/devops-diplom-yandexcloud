provider "yandex" {
  # service_account_key_file pulled from $YC__SERVICE_ACCOUNT_KEY_FILE
  # cloud_id pulled from $YC_CLOUD_ID
  # folder_id pulled from $YC_FOLDER_ID
  zone = var.zones[1]
}

provider "cloudflare" {
  # email pulled from $CLOUDFLARE_EMAIL
  # api_token pulled from $CLOUDFLARE_API_TOKEN
}