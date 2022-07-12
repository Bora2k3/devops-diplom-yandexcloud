#!/bin/zsh
# add Cloudflare DNS 1.1.1.1
sudo networksetup -setdnsservers Wi-Fi 1.1.1.1
sudo networksetup -setdnsservers USB\ 10/100/1000\ LAN 1.1.1.1
# add secret variables
export YC_SERVICE_ACCOUNT_KEY_FILE="/Users/podkovka/.key.json"
export YC_CLOUD_ID="............"
export YC_FOLDER_ID="............"
export YC_STORAGE_ACCESS_KEY="............"
export YC_STORAGE_SECRET_KEY="............"
export CLOUDFLARE_EMAIL=............
export CLOUDFLARE_API_TOKEN=............
# S3 initialization
cd terraform/s3_init/ || return
terraform init&& terraform plan&& terraform apply -auto-approve
# infrastructure deployment
cd ../stage/ || return
terraform init -reconfigure -backend-config "access_key=$YC_STORAGE_ACCESS_KEY" -backend-config "secret_key=$YC_STORAGE_SECRET_KEY"
terraform workspace new stage
terraform init&& terraform plan&& terraform apply -auto-approve

terraform output -json > output.json
sleep 5
# add variables
export vm_app_private=$(< output.json jq -r '.vm_app_private | .value')
export vm_db01_private=$(< output.json jq -r '.vm_db01_private | .value')
export vm_db02_private=$(< output.json jq -r '.vm_db02_private | .value')
export vm_gitlab_private=$(< output.json jq -r '.vm_gitlab_private | .value')
export vm_monitoring_private=$(< output.json jq -r '.vm_monitoring_private | .value')
export vm_proxy_private=$(< output.json jq -r '.vm_proxy_private | .value')
export vm_runner_private=$(< output.json jq -r '.vm_runner_private | .value')
# domain availability check
((count = 10))
while [[ $count -ne 0 ]] ; do
    sh ../../flushcache.sh
    ping -c 1 podkovka.ru.net
    rc=$?
    if [[ $rc -eq 0 ]] ; then
        ((count = 1))
    else
        sleep 5
    fi
    ((count = count - 1))
done

if [[ $rc -eq 0 ]] ; then
    echo "Host is available"
else
    echo "For reset cache DNS enter command"
    echo "sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"; exit
fi
# start ansible playbook
cd ../../stack-ansible || return
envsubst < "hosts.tmp" > "hosts"
sleep 5
ansible-playbook playbook.yml -i hosts
# return to home directory
cd ../
