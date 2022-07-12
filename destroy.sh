#!/bin/zsh
# add secret variables
export YC_SERVICE_ACCOUNT_KEY_FILE="/Users/podkovka/.key.json"
export YC_CLOUD_ID="............"
export YC_FOLDER_ID="............"
export YC_STORAGE_ACCESS_KEY="............"
export YC_STORAGE_SECRET_KEY="............"
export CLOUDFLARE_EMAIL=............
export CLOUDFLARE_API_TOKEN=............
# destroy terraform stage
cd terraform/stage || return
terraform destroy -auto-approve
# destroy terraform s3
cd ../s3_init || return
terraform destroy -auto-approve
# delete variables
unset YC_SERVICE_ACCOUNT_KEY_FILE&& unset YC_CLOUD_ID&& unset YC_CLOUD_ID&& unset YC_FOLDER_ID&& \
unset YC_STORAGE_ACCESS_KEY&& unset YC_STORAGE_SECRET_KEY&& unset CLOUDFLARE_EMAIL&& \
unset CLOUDFLARE_API_TOKEN&& unset vm_app_private&& unset vm_db01_private&& unset vm_db02_private&& \
unset vm_gitlab_private&& unset vm_monitoring_private&& unset vm_proxy_private&& unset vm_runner_private

sudo sed -i '' -e '/^podkovka.ru.net/d' ~/.ssh/known_hosts
sudo networksetup -setdnsservers Wi-Fi "Empty"&& sudo networksetup -setdnsservers USB\ 10/100/1000\ LAN "Empty"
