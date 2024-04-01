targetScope = 'subscription'

resource notifications 'Microsoft.Security/securityContacts@2020-01-01-preview' = {
  name: 'default'
  properties: {
    alertNotifications: {
       minimalSeverity: 'Medium'
       state: 'On'
    }
    notificationsByRole: {
      roles: [
        'Owner'
      ]
    }
  }
}
