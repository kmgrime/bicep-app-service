@description('The location will be the same as the ResourceGroup location.')
param location string = resourceGroup().location

@description('Insert App plan name.')
@minLength(1)
@maxLength(25)
param planName string = 'insert name here'

@description('Insert App Service name.')
@minLength(1)
@maxLength(25)
param appName string = 'insert name here'

resource appServicePlan 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: planName
  location: location
  sku: {
    name: 'F1'
    capacity: 1
  }
}

resource webApplication 'Microsoft.Web/sites@2018-11-01' = {
  name: appName
  location: location
  dependsOn: [
    appServicePlan
  ]
  
  properties: {
    serverFarmId: planName
    
  }
}

