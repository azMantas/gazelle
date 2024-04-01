targetScope = 'subscription'

param secOpsMail string = 'secops@gazelle.cloud'

resource notifications 'Microsoft.Security/securityContacts@2020-01-01-preview' = {
  name: 'default'
  properties: {
    alertNotifications: {
       minimalSeverity: 'High'
       state: 'On'
    }
    notificationsByRole: {
      roles: [
        'Owner'
        'Contributor'
      ]
    }
    emails: secOpsMail
  }
}
