$tenantId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
$subscriptionId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
$resourceGroup = "xxx"
$location = "xxxx"
$registry_name = "xxxxx"
$sourceContainer = "mcr.microsoft.com/dotnet/samples:aspnetapp"
$sku4Linux = "S1"
$appName = "xxxxxx"
$planLinux = "AppServiceLinuxDockerPlan"
$container_name = "dotnet-aspnet"
$version = "3.0"

az login --tenant ${tenantId}

az account set --subscription ${subscriptionId}

# Create a resource group.
az group create --name ${resourceGroup} --location ${location}

# Create an Azure Container Registry.
az acr create --name ${registry_name} --resource-group ${resourceGroup} --location ${location} --sku basic --admin-enabled true --query loginServer --output tsv

# Import from Docker Hub
az acr import -n ${registry_name} --source $sourceContainer -t "${container_name}:${version}"

# Show ACR credentials.
az acr credential show --name ${registry_name} --resource-group ${resourceGroup} --query "[username,passwords[?name=='password'].value]" --output tsv

$registry_user = "xxxxxxx" # from resurlt of az acr credential show
$registry_password = "xxxxxxx" # from resurlt of az acr credential show

# Create an App Service plan for Linux.
az appservice plan create --name ${planLinux} --resource-group ${resourceGroup} --location ${location} --is-linux --sku ${sku4Linux} --debug

# Create a web app.
az webapp create --name ${appName} --plan ${planLinux} --resource-group ${resourceGroup} `
--deployment-container-image-name "https://${registry_name}.azurecr.io/${container_name}:${version}" `
--docker-registry-server-user ${registry_user} `
--docker-registry-server-password ${registry_password} `
--debug
