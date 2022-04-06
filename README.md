## bicep-app-service
Deployment of AppService in Azure with Bicep

### Deployment
````
az ts create --name newAppService --version 0.1 --resource-group bicep-app-service --location "westus" --template-file main.bicep
```