$tenantId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
$subscriptionId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
$resourceGroup = "xxx"
$registry_name = "xxxx"
$container_name = "dotnet-aspnet"
$version = "1.0"
$containerGroupName = "aci-demo-linux"

az login --tenant ${tenantId}

az account set --subscription ${subscriptionId}


$ACR_LOGIN_SERVER=$(az acr show --name $registry_name --resource-group $resourceGroup  --query "loginServer" --output tsv)

# Show ACR credentials.
az acr credential show --name ${registry_name} --resource-group ${resourceGroup} --query "[username,passwords[?name=='password'].value]" --output tsv

$registry_user = "xxxxxxx" # from resurlt of az acr credential show
$registry_password = "xxxxxxx" # from resurlt of az acr credential show

$RANDOM = $(-join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_}))
az container create `
    --name $containerGroupName `
    --resource-group $resourceGroup `
    --image "${ACR_LOGIN_SERVER}/${container_name}:${version}" `
    --registry-login-server $ACR_LOGIN_SERVER `
    --registry-username $registry_user `
    --registry-password $registry_password `
    --dns-name-label "${containerGroupName}-$RANDOM" `
    --os-type Linux `
    --query ipAddress.fqdn `
    --debug
