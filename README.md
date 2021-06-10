# Sample Azure Container Instance + Web App for Containers  + Azure Container Registry

## Common Setting
- $tenantId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" <- Tenant ID from Azure AD
- $subscriptionId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" <- Subscription ID from Azure Portal or Azure CLI or PowerShell AZ Module
- $resourceGroup = "xxx" <- Any string (Global Unique)
- $registry_name = "xxxx" <- Any string (Global Unique)
```
$tenantId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
$subscriptionId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
$resourceGroup = "xxx"
$registry_name = "xxxx"
```

- $registry_user = "xxxxxxx" <- from resurlt of az acr credential show
- $registry_password = "xxxxxxx" <- # from resurlt of az acr credential show
```
$registry_user = "xxxxxxx" # from resurlt of az acr credential show
$registry_password = "xxxxxxx" # from resurlt of az acr credential show
```
## Azure Container Instance(Linux) or (Windows) + Azure Container Registry (deploy-aci4linux.ps1)

nothing in particular

## Web App for Containers (Linux) or (windows) + Azure Container Registry (deploy-aci4linux.ps1)

- $appName = "xxxxxx" <- Any string (Global Unique)
```
$appName = "xxxxxx"
```

## Execute each command.
