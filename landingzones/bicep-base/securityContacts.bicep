targetScope = 'subscription'

param secOpsEmail string = 'secOps@gazelle.cloud'


resource notifications 'Microsoft.Security/securityContacts@2020-01-01-preview' = {
  name: 'default'
  properties: {
    alertNotifications: {
      minimalSeverity: 'High'
      state: 'On'
    }
    notificationsByRole: {
      state: 'On'
      roles: [
        'Owner'
        'Contributor'
      ]
    }
    emails: secOpsEmail
  }
}
