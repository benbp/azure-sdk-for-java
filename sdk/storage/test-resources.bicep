param baseName string
param endpointSuffix string = 'core.windows.net'

@description('The tenant ID to which the application and resources belong.')
param tenantId string = '72f988bf-86f1-41af-91ab-2d7cd011db47'

@description('The principal to assign the role to. This is application object id.')
param testApplicationOid string

var storageApiVersion = '2019-06-01'
var keyVaultApiVersion = '2016-10-01'
var authorizationApiVersion = '2018-09-01-preview'
var blobDataContributorRoleId = '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/ba92f5b4-2d11-453d-a403-e96b0029c9fe'
var contributorRoleId = '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'
var blobDataOwnerRoleId = '/subscriptions/${subscription().subscriptionId}/providers/Microsoft.Authorization/roleDefinitions/b7e6dc6d-f1e8-4753-8033-0f276bb0955b'
var primaryAccountName_var = 'prim${baseName}'
var secondaryAccountName_var = 'sec${baseName}'
var premiumAccountName_var = 'prem${baseName}'
var versionedAccountName_var = 'ver${baseName}'
var dataLakeAccountName_var = 'dtlk${baseName}'
var premiumFileAccountName_var = 'premf${baseName}'
var keyvaultName_var = '${baseName}kvlt'
var azureKeyVaultUrl = 'https://${keyvaultName_var}.vault.azure.net'
var location = resourceGroup().location

resource dataContributorRoleId_primaryAccountName 'Microsoft.Authorization/roleAssignments@[variables(\'authorizationApiVersion\')]' = {
  name: guid('dataContributorRoleId${primaryAccountName_var}')
  properties: {
    roleDefinitionId: blobDataContributorRoleId
    principalId: testApplicationOid
  }
  dependsOn: [
    primaryAccountName_var
  ]
}

resource contributorRoleId_primaryAccountName 'Microsoft.Authorization/roleAssignments@[variables(\'authorizationApiVersion\')]' = {
  name: guid('contributorRoleId${primaryAccountName_var}')
  properties: {
    roleDefinitionId: contributorRoleId
    principalId: testApplicationOid
  }
  dependsOn: [
    primaryAccountName_var
  ]
}

resource blobDataOwnerRoleId_primaryAccountName 'Microsoft.Authorization/roleAssignments@[variables(\'authorizationApiVersion\')]' = {
  name: guid('blobDataOwnerRoleId${primaryAccountName_var}')
  properties: {
    roleDefinitionId: blobDataOwnerRoleId
    principalId: testApplicationOid
  }
  dependsOn: [
    primaryAccountName_var
  ]
}

resource primaryAccountName 'Microsoft.Storage/storageAccounts@[variables(\'storageApiVersion\')]' = {
  name: primaryAccountName_var
  location: location
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          enabled: true
        }
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource primaryAccountName_default 'Microsoft.Storage/storageAccounts/blobServices@[variables(\'storageApiVersion\')]' = {
  name: '${primaryAccountName_var}/default'
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 1
    }
  }
  dependsOn: [
    primaryAccountName_var
  ]
}

resource Microsoft_Storage_storageAccounts_fileServices_primaryAccountName_default 'Microsoft.Storage/storageAccounts/fileServices@[variables(\'storageApiVersion\')]' = {
  name: '${primaryAccountName_var}/default'
  properties: {
    shareDeleteRetentionPolicy: {
      enabled: true
      days: 1
    }
  }
  dependsOn: [
    primaryAccountName_var
  ]
}

resource primaryAccountName_testscope1 'Microsoft.Storage/storageAccounts/encryptionScopes@[variables(\'storageApiVersion\')]' = {
  name: '${primaryAccountName_var}/testscope1'
  properties: {}
  dependsOn: [
    primaryAccountName_var
  ]
}

resource primaryAccountName_testscope2 'Microsoft.Storage/storageAccounts/encryptionScopes@[variables(\'storageApiVersion\')]' = {
  name: '${primaryAccountName_var}/testscope2'
  properties: {}
  dependsOn: [
    primaryAccountName_var
  ]
}

resource secondaryAccountName 'Microsoft.Storage/storageAccounts@[variables(\'storageApiVersion\')]' = {
  name: secondaryAccountName_var
  location: location
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          enabled: true
        }
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource premiumAccountName 'Microsoft.Storage/storageAccounts@[variables(\'storageApiVersion\')]' = {
  name: premiumAccountName_var
  location: location
  sku: {
    name: 'Premium_LRS'
    tier: 'Premium'
  }
  kind: 'StorageV2'
  properties: {
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          enabled: true
        }
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource versionedAccountName 'Microsoft.Storage/storageAccounts@[variables(\'storageApiVersion\')]' = {
  name: versionedAccountName_var
  location: location
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          enabled: true
        }
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource versionedAccountName_default 'Microsoft.Storage/storageAccounts/blobServices@[variables(\'storageApiVersion\')]' = {
  name: '${versionedAccountName_var}/default'
  properties: {
    isVersioningEnabled: true
  }
  dependsOn: [
    versionedAccountName
  ]
}

resource dataLakeAccountName 'Microsoft.Storage/storageAccounts@[variables(\'storageApiVersion\')]' = {
  name: dataLakeAccountName_var
  location: location
  sku: {
    name: 'Standard_RAGRS'
    tier: 'Standard'
  }
  kind: 'StorageV2'
  properties: {
    isHnsEnabled: true
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          enabled: true
        }
        blob: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
    accessTier: 'Hot'
  }
}

resource dataLakeAccountName_default 'Microsoft.Storage/storageAccounts/blobServices@[variables(\'storageApiVersion\')]' = {
  name: '${dataLakeAccountName_var}/default'
  properties: {
    containerDeleteRetentionPolicy: {
      enabled: true
      days: 1
    }
  }
  dependsOn: [
    dataLakeAccountName
  ]
}

resource premiumFileAccountName 'Microsoft.Storage/storageAccounts@[variables(\'storageApiVersion\')]' = {
  name: premiumFileAccountName_var
  location: location
  sku: {
    name: 'Premium_LRS'
    tier: 'Premium'
  }
  kind: 'FileStorage'
  properties: {
    networkAcls: {
      bypass: 'AzureServices'
      virtualNetworkRules: []
      ipRules: []
      defaultAction: 'Allow'
    }
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        file: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
  }
}

resource keyvaultName 'Microsoft.KeyVault/vaults@[variables(\'keyvaultApiVersion\')]' = {
  name: keyvaultName_var
  location: location
  properties: {
    sku: {
      family: 'A'
      name: 'premium'
    }
    tenantId: tenantId
    accessPolicies: [
      {
        tenantId: tenantId
        objectId: testApplicationOid
        permissions: {
          keys: [
            'get'
            'list'
            'update'
            'create'
            'import'
            'delete'
            'recover'
            'backup'
            'restore'
            'decrypt'
            'encrypt'
            'unwrapKey'
            'wrapKey'
            'verify'
            'sign'
            'purge'
          ]
          secrets: [
            'get'
            'list'
            'set'
            'delete'
            'recover'
            'backup'
            'restore'
            'purge'
          ]
          certificates: [
            'get'
            'list'
            'update'
            'create'
            'import'
            'delete'
            'recover'
            'backup'
            'restore'
            'managecontacts'
            'manageissuers'
            'getissuers'
            'listissuers'
            'setissuers'
            'deleteissuers'
            'purge'
          ]
        }
      }
    ]
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: false
    enableSoftDelete: false
  }
}

output PRIMARY_STORAGE_ACCOUNT_NAME string = primaryAccountName_var
output PRIMARY_STORAGE_ACCOUNT_KEY string = listKeys(primaryAccountName.id, storageApiVersion).keys[0].value
output SECONDARY_STORAGE_ACCOUNT_NAME string = secondaryAccountName_var
output SECONDARY_STORAGE_ACCOUNT_KEY string = listKeys(secondaryAccountName.id, storageApiVersion).keys[0].value
output BLOB_STORAGE_ACCOUNT_NAME string = secondaryAccountName_var
output BLOB_STORAGE_ACCOUNT_KEY string = listKeys(secondaryAccountName.id, storageApiVersion).keys[0].value
output PREMIUM_STORAGE_ACCOUNT_NAME string = premiumAccountName_var
output PREMIUM_STORAGE_ACCOUNT_KEY string = listKeys(premiumAccountName.id, storageApiVersion).keys[0].value
output VERSIONED_STORAGE_ACCOUNT_NAME string = versionedAccountName_var
output VERSIONED_STORAGE_ACCOUNT_KEY string = listKeys(versionedAccountName.id, storageApiVersion).keys[0].value
output AZURE_STORAGE_FILE_ACCOUNT_NAME string = primaryAccountName_var
output AZURE_STORAGE_FILE_ACCOUNT_KEY string = listKeys(primaryAccountName.id, storageApiVersion).keys[0].value
output AZURE_STORAGE_FILE_ENDPOINT string = reference(primaryAccountName.id, storageApiVersion).primaryEndpoints.file
output PREMIUM_STORAGE_FILE_ACCOUNT_NAME string = premiumFileAccountName_var
output PREMIUM_STORAGE_FILE_ACCOUNT_KEY string = listKeys(premiumFileAccountName.id, storageApiVersion).keys[0].value
output AZURE_STORAGE_QUEUE_ACCOUNT_NAME string = primaryAccountName_var
output AZURE_STORAGE_QUEUE_ACCOUNT_KEY string = listKeys(primaryAccountName.id, storageApiVersion).keys[0].value
output AZURE_STORAGE_QUEUE_ENDPOINT string = reference(primaryAccountName.id, storageApiVersion).primaryEndpoints.queue
output STORAGE_DATA_LAKE_ACCOUNT_NAME string = dataLakeAccountName_var
output STORAGE_DATA_LAKE_ACCOUNT_KEY string = listKeys(dataLakeAccountName.id, storageApiVersion).keys[0].value
output AZURE_STORAGE_BLOB_CONNECTION_STRING string = 'DefaultEndpointsProtocol=https;AccountName=${primaryAccountName_var};AccountKey=${listKeys(primaryAccountName.id, storageApiVersion).keys[0].value};EndpointSuffix=${endpointSuffix}'
output AZURE_STORAGE_FILE_CONNECTION_STRING string = 'DefaultEndpointsProtocol=https;AccountName=${primaryAccountName_var};AccountKey=${listKeys(primaryAccountName.id, storageApiVersion).keys[0].value};EndpointSuffix=${endpointSuffix}'
output AZURE_STORAGE_QUEUE_CONNECTION_STRING string = 'DefaultEndpointsProtocol=https;AccountName=${primaryAccountName_var};AccountKey=${listKeys(primaryAccountName.id, storageApiVersion).keys[0].value};EndpointSuffix=${endpointSuffix}'
output KEYVAULT_URL string = azureKeyVaultUrl