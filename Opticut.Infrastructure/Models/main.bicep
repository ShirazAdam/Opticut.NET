@secure()
param vulnerabilityAssessments_Default_storageContainerPath string
param sites_opticut_name string = 'opticut'
param sites_opticutapi_name string = 'opticutapi'
param servers_opticut_server_name string = 'opticut-server'
param components_opticut_name string = 'opticut'
param components_opticutapi_name string = 'opticutapi'
param virtualNetworks_opticut_vnet_name string = 'opticut-vnet'
param serverfarms_OpticutAppServicePlan_name string = 'OpticutAppServicePlan'
param privateEndpoints_opticut_app_endpoint_name string = 'opticut-app-endpoint'
param privateEndpoints_opticut_database_server_endpoint_name string = 'opticut-database-server-endpoint'
param networkSecurityGroups_opticut_inbound_nsg_name string = 'opticut-inbound-nsg'
param networkSecurityGroups_opticut_outbound_nsg_name string = 'opticut-outbound-nsg'
param networkSecurityGroups_opticut_db_server_nsg_name string = 'opticut-db-server-nsg'
param networkSecurityGroups_opticut_web_inbound_nsg_name string = 'opticut-web-inbound-nsg'
param privateDnsZones_privatelink_azurewebsites_net_name string = 'privatelink.azurewebsites.net'
param networkSecurityGroups_opticut_web_outbound_nsg_name string = 'opticut-web-outbound-nsg'
param privateDnsZones_privatelink_database_windows_net_name string = 'privatelink.database.windows.net'
param smartdetectoralertrules_failure_anomalies_opticutapi_name string = 'failure anomalies - opticutapi'
param actiongroups_application_insights_smart_detection_externalid string = '/subscriptions/{SubscriptionID}/resourceGroups/puzzle/providers/microsoft.insights/actiongroups/application insights smart detection'
param workspaces_operational_insights string = '/subscriptions/{SubscriptionID}/resourceGroups/DefaultResourceGroup-SUK/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-{WorkspaceID}-SUK'

resource components_opticut_name_resource 'microsoft.insights/components@2020-02-02' = {
  name: components_opticut_name
  location: 'uksouth'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaWebAppExtensionCreate'
    RetentionInDays: 90
    WorkspaceResourceId: workspaces_operational_insights
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource components_opticutapi_name_resource 'microsoft.insights/components@2020-02-02' = {
  name: components_opticutapi_name
  location: 'uksouth'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Flow_Type: 'Redfield'
    Request_Source: 'IbizaWebAppExtensionCreate'
    RetentionInDays: 90
    WorkspaceResourceId: workspaces_operational_insights
    IngestionMode: 'LogAnalytics'
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
}

resource networkSecurityGroups_opticut_db_server_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: networkSecurityGroups_opticut_db_server_nsg_name
  location: 'uksouth'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  properties: {
    securityRules: []
  }
}

resource networkSecurityGroups_opticut_inbound_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: networkSecurityGroups_opticut_inbound_nsg_name
  location: 'uksouth'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  properties: {
    securityRules: []
  }
}

resource networkSecurityGroups_opticut_outbound_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: networkSecurityGroups_opticut_outbound_nsg_name
  location: 'uksouth'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  properties: {
    securityRules: []
  }
}

resource networkSecurityGroups_opticut_web_inbound_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: networkSecurityGroups_opticut_web_inbound_nsg_name
  location: 'uksouth'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  properties: {
    securityRules: []
  }
}

resource networkSecurityGroups_opticut_web_outbound_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2024-05-01' = {
  name: networkSecurityGroups_opticut_web_outbound_nsg_name
  location: 'uksouth'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  properties: {
    securityRules: []
  }
}

resource privateDnsZones_privatelink_azurewebsites_net_name_resource 'Microsoft.Network/privateDnsZones@2024-06-01' = {
  name: privateDnsZones_privatelink_azurewebsites_net_name
  location: 'global'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {}
}

resource privateDnsZones_privatelink_database_windows_net_name_resource 'Microsoft.Network/privateDnsZones@2024-06-01' = {
  name: privateDnsZones_privatelink_database_windows_net_name
  location: 'global'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {}
}

resource servers_opticut_server_name_resource 'Microsoft.Sql/servers@2024-05-01-preview' = {
  name: servers_opticut_server_name
  location: 'uksouth'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  kind: 'v12.0'
  properties: {
    administratorLogin: '${servers_opticut_server_name}-admin'
    version: '12.0'
    minimalTlsVersion: '1.2'
    publicNetworkAccess: 'Disabled'
    restrictOutboundNetworkAccess: 'Disabled'
  }
}

resource serverfarms_OpticutAppServicePlan_name_resource 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: serverfarms_OpticutAppServicePlan_name
  location: 'UK South'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  sku: {
    name: 'P0v3'
    tier: 'Premium0V3'
    size: 'P0v3'
    family: 'Pv3'
    capacity: 1
  }
  kind: 'app'
  properties: {
    perSiteScaling: false
    elasticScaleEnabled: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: false
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
    zoneRedundant: false
  }
}

resource smartdetectoralertrules_failure_anomalies_opticutapi_name_resource 'microsoft.alertsmanagement/smartdetectoralertrules@2021-04-01' = {
  name: smartdetectoralertrules_failure_anomalies_opticutapi_name
  location: 'global'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    description: 'Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls.'
    state: 'Enabled'
    severity: 'Sev3'
    frequency: 'PT1M'
    detector: {
      id: 'FailureAnomaliesDetector'
    }
    scope: [
      components_opticutapi_name_resource.id
    ]
    actionGroups: {
      groupIds: [
        actiongroups_application_insights_smart_detection_externalid
      ]
    }
  }
}

resource components_opticut_name_degradationindependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'degradationindependencyduration'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'degradationindependencyduration'
      DisplayName: 'Degradation in dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_degradationindependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'degradationindependencyduration'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'degradationindependencyduration'
      DisplayName: 'Degradation in dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_degradationinserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'degradationinserverresponsetime'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'degradationinserverresponsetime'
      DisplayName: 'Degradation in server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_degradationinserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'degradationinserverresponsetime'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'degradationinserverresponsetime'
      DisplayName: 'Degradation in server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_digestMailConfiguration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'digestMailConfiguration'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'digestMailConfiguration'
      DisplayName: 'Digest Mail Configuration'
      Description: 'This rule describes the digest mail preferences'
      HelpUrl: 'www.homail.com'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_digestMailConfiguration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'digestMailConfiguration'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'digestMailConfiguration'
      DisplayName: 'Digest Mail Configuration'
      Description: 'This rule describes the digest mail preferences'
      HelpUrl: 'www.homail.com'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_extension_billingdatavolumedailyspikeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'extension_billingdatavolumedailyspikeextension'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_billingdatavolumedailyspikeextension'
      DisplayName: 'Abnormal rise in daily data volume (preview)'
      Description: 'This detection rule automatically analyzes the billing data generated by your application, and can warn you about an unusual increase in your application\'s billing costs'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/billing-data-volume-daily-spike.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_extension_billingdatavolumedailyspikeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'extension_billingdatavolumedailyspikeextension'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_billingdatavolumedailyspikeextension'
      DisplayName: 'Abnormal rise in daily data volume (preview)'
      Description: 'This detection rule automatically analyzes the billing data generated by your application, and can warn you about an unusual increase in your application\'s billing costs'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/billing-data-volume-daily-spike.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_extension_canaryextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'extension_canaryextension'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_canaryextension'
      DisplayName: 'Canary extension'
      Description: 'Canary extension'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_extension_canaryextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'extension_canaryextension'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_canaryextension'
      DisplayName: 'Canary extension'
      Description: 'Canary extension'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/'
      IsHidden: true
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_extension_exceptionchangeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'extension_exceptionchangeextension'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_exceptionchangeextension'
      DisplayName: 'Abnormal rise in exception volume (preview)'
      Description: 'This detection rule automatically analyzes the exceptions thrown in your application, and can warn you about unusual patterns in your exception telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/abnormal-rise-in-exception-volume.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_extension_exceptionchangeextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'extension_exceptionchangeextension'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_exceptionchangeextension'
      DisplayName: 'Abnormal rise in exception volume (preview)'
      Description: 'This detection rule automatically analyzes the exceptions thrown in your application, and can warn you about unusual patterns in your exception telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/abnormal-rise-in-exception-volume.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_extension_memoryleakextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'extension_memoryleakextension'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_memoryleakextension'
      DisplayName: 'Potential memory leak detected (preview)'
      Description: 'This detection rule automatically analyzes the memory consumption of each process in your application, and can warn you about potential memory leaks or increased memory consumption.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/memory-leak.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_extension_memoryleakextension 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'extension_memoryleakextension'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_memoryleakextension'
      DisplayName: 'Potential memory leak detected (preview)'
      Description: 'This detection rule automatically analyzes the memory consumption of each process in your application, and can warn you about potential memory leaks or increased memory consumption.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/tree/master/SmartDetection/memory-leak.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_extension_securityextensionspackage 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'extension_securityextensionspackage'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_securityextensionspackage'
      DisplayName: 'Potential security issue detected (preview)'
      Description: 'This detection rule automatically analyzes the telemetry generated by your application and detects potential security issues.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/application-security-detection-pack.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_extension_securityextensionspackage 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'extension_securityextensionspackage'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_securityextensionspackage'
      DisplayName: 'Potential security issue detected (preview)'
      Description: 'This detection rule automatically analyzes the telemetry generated by your application and detects potential security issues.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/application-security-detection-pack.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_extension_traceseveritydetector 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'extension_traceseveritydetector'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_traceseveritydetector'
      DisplayName: 'Degradation in trace severity ratio (preview)'
      Description: 'This detection rule automatically analyzes the trace logs emitted from your application, and can warn you about unusual patterns in the severity of your trace telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/degradation-in-trace-severity-ratio.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_extension_traceseveritydetector 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'extension_traceseveritydetector'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'extension_traceseveritydetector'
      DisplayName: 'Degradation in trace severity ratio (preview)'
      Description: 'This detection rule automatically analyzes the trace logs emitted from your application, and can warn you about unusual patterns in the severity of your trace telemetry.'
      HelpUrl: 'https://github.com/Microsoft/ApplicationInsights-Home/blob/master/SmartDetection/degradation-in-trace-severity-ratio.md'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_longdependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'longdependencyduration'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'longdependencyduration'
      DisplayName: 'Long dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_longdependencyduration 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'longdependencyduration'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'longdependencyduration'
      DisplayName: 'Long dependency duration'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_migrationToAlertRulesCompleted 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'migrationToAlertRulesCompleted'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'migrationToAlertRulesCompleted'
      DisplayName: 'Migration To Alert Rules Completed'
      Description: 'A configuration that controls the migration state of Smart Detection to Smart Alerts'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: true
      IsEnabledByDefault: false
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: false
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_migrationToAlertRulesCompleted 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'migrationToAlertRulesCompleted'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'migrationToAlertRulesCompleted'
      DisplayName: 'Migration To Alert Rules Completed'
      Description: 'A configuration that controls the migration state of Smart Detection to Smart Alerts'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: true
      IsEnabledByDefault: false
      IsInPreview: true
      SupportsEmailNotifications: false
    }
    Enabled: false
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_slowpageloadtime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'slowpageloadtime'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'slowpageloadtime'
      DisplayName: 'Slow page load time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_slowpageloadtime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'slowpageloadtime'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'slowpageloadtime'
      DisplayName: 'Slow page load time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticut_name_slowserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticut_name_resource
  name: 'slowserverresponsetime'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'slowserverresponsetime'
      DisplayName: 'Slow server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource components_opticutapi_name_slowserverresponsetime 'microsoft.insights/components/ProactiveDetectionConfigs@2018-05-01-preview' = {
  parent: components_opticutapi_name_resource
  name: 'slowserverresponsetime'
  location: 'uksouth'
  properties: {
    RuleDefinitions: {
      Name: 'slowserverresponsetime'
      DisplayName: 'Slow server response time'
      Description: 'Smart Detection rules notify you of performance anomaly issues.'
      HelpUrl: 'https://docs.microsoft.com/en-us/azure/application-insights/app-insights-proactive-performance-diagnostics'
      IsHidden: false
      IsEnabledByDefault: true
      IsInPreview: false
      SupportsEmailNotifications: true
    }
    Enabled: true
    SendEmailsToSubscriptionOwners: true
    CustomEmails: []
  }
}

resource privateDnsZones_privatelink_azurewebsites_net_name_opticutapi_dkadbxaucwhya2fa_scm_uksouth_01 'Microsoft.Network/privateDnsZones/A@2024-06-01' = {
  parent: privateDnsZones_privatelink_azurewebsites_net_name_resource
  name: 'opticutapi-dkadbxaucwhya2fa.scm.uksouth-01'
  properties: {
    metadata: {
      creator: 'created by private endpoint opticut-app-endpoint with resource guid 2f9acb26-44ce-4092-aad3-a27b7ddf9341'
    }
    ttl: 10
    aRecords: [
      {
        ipv4Address: '10.0.0.4'
      }
    ]
  }
}

resource privateDnsZones_privatelink_azurewebsites_net_name_opticutapi_dkadbxaucwhya2fa_uksouth_01 'Microsoft.Network/privateDnsZones/A@2024-06-01' = {
  parent: privateDnsZones_privatelink_azurewebsites_net_name_resource
  name: 'opticutapi-dkadbxaucwhya2fa.uksouth-01'
  properties: {
    metadata: {
      creator: 'created by private endpoint opticut-app-endpoint with resource guid 2f9acb26-44ce-4092-aad3-a27b7ddf9341'
    }
    ttl: 10
    aRecords: [
      {
        ipv4Address: '10.0.0.4'
      }
    ]
  }
}

resource privateDnsZones_privatelink_database_windows_net_name_opticut_server 'Microsoft.Network/privateDnsZones/A@2024-06-01' = {
  parent: privateDnsZones_privatelink_database_windows_net_name_resource
  name: 'opticut-server'
  properties: {
    metadata: {
      creator: 'created by private endpoint opticut-database-server-endpoint with resource guid 9713e008-8fe2-4882-95c7-e261d8caa934'
    }
    ttl: 10
    aRecords: [
      {
        ipv4Address: '10.0.2.4'
      }
    ]
  }
}

resource Microsoft_Network_privateDnsZones_SOA_privateDnsZones_privatelink_azurewebsites_net_name 'Microsoft.Network/privateDnsZones/SOA@2024-06-01' = {
  parent: privateDnsZones_privatelink_azurewebsites_net_name_resource
  name: '@'
  properties: {
    ttl: 3600
    soaRecord: {
      email: 'azureprivatedns-host.microsoft.com'
      expireTime: 2419200
      host: 'azureprivatedns.net'
      minimumTtl: 10
      refreshTime: 3600
      retryTime: 300
      serialNumber: 1
    }
  }
}

resource Microsoft_Network_privateDnsZones_SOA_privateDnsZones_privatelink_database_windows_net_name 'Microsoft.Network/privateDnsZones/SOA@2024-06-01' = {
  parent: privateDnsZones_privatelink_database_windows_net_name_resource
  name: '@'
  properties: {
    ttl: 3600
    soaRecord: {
      email: 'azureprivatedns-host.microsoft.com'
      expireTime: 2419200
      host: 'azureprivatedns.net'
      minimumTtl: 10
      refreshTime: 3600
      retryTime: 300
      serialNumber: 1
    }
  }
}

resource servers_opticut_server_name_Default 'Microsoft.Sql/servers/advancedThreatProtectionSettings@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource servers_opticut_server_name_CreateIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_resource
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_opticut_server_name_DbParameterization 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_resource
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_opticut_server_name_DefragmentIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_resource
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_opticut_server_name_DropIndex 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_resource
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
}

resource servers_opticut_server_name_ForceLastGoodPlan 'Microsoft.Sql/servers/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_resource
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
}

resource Microsoft_Sql_servers_auditingPolicies_servers_opticut_server_name_Default 'Microsoft.Sql/servers/auditingPolicies@2014-04-01' = {
  parent: servers_opticut_server_name_resource
  name: 'Default'
  location: 'UK South'
  properties: {
    auditingState: 'Disabled'
  }
}

resource Microsoft_Sql_servers_auditingSettings_servers_opticut_server_name_Default 'Microsoft.Sql/servers/auditingSettings@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource Microsoft_Sql_servers_connectionPolicies_servers_opticut_server_name_default 'Microsoft.Sql/servers/connectionPolicies@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'default'
  location: 'uksouth'
  properties: {
    connectionType: 'Default'
  }
}

resource servers_opticut_server_name_opticut_database 'Microsoft.Sql/servers/databases@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'opticut-database'
  location: 'uksouth'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
  }
  sku: {
    name: 'GP_Gen5'
    tier: 'GeneralPurpose'
    family: 'Gen5'
    capacity: 2
  }
  kind: 'v12.0,user,vcore'
  properties: {
    collation: 'SQL_Latin1_General_CP1_CI_AS'
    maxSizeBytes: 34359738368
    catalogCollation: 'SQL_Latin1_General_CP1_CI_AS'
    zoneRedundant: false
    licenseType: 'LicenseIncluded'
    readScale: 'Disabled'
    requestedBackupStorageRedundancy: 'Geo'
    maintenanceConfigurationId: '/subscriptions/{SubscriptionID}/providers/Microsoft.Maintenance/publicMaintenanceConfigurations/SQL_Default'
    isLedgerOn: false
    availabilityZone: 'NoPreference'
  }
}

resource servers_opticut_server_name_master_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-05-01-preview' = {
  name: '${servers_opticut_server_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_opticut_server_name_master_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  name: '${servers_opticut_server_name}/master/Default'
  location: 'UK South'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_opticut_server_name_master_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-05-01-preview' = {
  name: '${servers_opticut_server_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_opticut_server_name_master_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-05-01-preview' = {
  name: '${servers_opticut_server_name}/master/Default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_opticut_server_name_master_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-05-01-preview' = {
  name: '${servers_opticut_server_name}/master/Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource servers_opticut_server_name_master_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-05-01-preview' = {
  name: '${servers_opticut_server_name}/master/Current'
  properties: {}
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_opticut_server_name_master_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-05-01-preview' = {
  name: '${servers_opticut_server_name}/master/Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_opticut_server_name_master_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-05-01-preview' = {
  name: '${servers_opticut_server_name}/master/Current'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_opticut_server_name_master_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-05-01-preview' = {
  name: '${servers_opticut_server_name}/master/Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_devOpsAuditingSettings_servers_opticut_server_name_Default 'Microsoft.Sql/servers/devOpsAuditingSettings@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'Default'
  properties: {
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_opticut_server_name_current 'Microsoft.Sql/servers/encryptionProtector@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'current'
  kind: 'servicemanaged'
  properties: {
    serverKeyName: 'ServiceManaged'
    serverKeyType: 'ServiceManaged'
    autoRotationEnabled: false
  }
}

resource Microsoft_Sql_servers_extendedAuditingSettings_servers_opticut_server_name_Default 'Microsoft.Sql/servers/extendedAuditingSettings@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'default'
  properties: {
    retentionDays: 0
    auditActionsAndGroups: []
    isStorageSecondaryKeyInUse: false
    isAzureMonitorTargetEnabled: false
    isManagedIdentityInUse: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
}

resource servers_opticut_server_name_ServiceManaged 'Microsoft.Sql/servers/keys@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'ServiceManaged'
  kind: 'servicemanaged'
  properties: {
    serverKeyType: 'ServiceManaged'
  }
}

resource Microsoft_Sql_servers_securityAlertPolicies_servers_opticut_server_name_Default 'Microsoft.Sql/servers/securityAlertPolicies@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
}

resource Microsoft_Sql_servers_sqlVulnerabilityAssessments_servers_opticut_server_name_Default 'Microsoft.Sql/servers/sqlVulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
}

resource Microsoft_Sql_servers_vulnerabilityAssessments_servers_opticut_server_name_Default 'Microsoft.Sql/servers/vulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
    storageContainerPath: vulnerabilityAssessments_Default_storageContainerPath
  }
}

resource sites_opticut_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticut_name_resource
  name: 'ftp'
  location: 'UK South'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
    'hidden-link: /app-insights-resource-id': '/subscriptions/{SubscriptionID}/resourceGroups/Opticut/providers/microsoft.insights/components/opticut'
  }
  properties: {
    allow: false
  }
}

resource sites_opticutapi_name_ftp 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticutapi_name_resource
  name: 'ftp'
  location: 'UK South'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
    'hidden-link: /app-insights-resource-id': '/subscriptions/{SubscriptionID}/resourceGroups/Opticut/providers/microsoft.insights/components/opticutapi'
  }
  properties: {
    allow: false
  }
}

resource sites_opticut_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticut_name_resource
  name: 'scm'
  location: 'UK South'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
    'hidden-link: /app-insights-resource-id': '/subscriptions/{SubscriptionID}/resourceGroups/Opticut/providers/microsoft.insights/components/opticut'
  }
  properties: {
    allow: false
  }
}

resource sites_opticutapi_name_scm 'Microsoft.Web/sites/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticutapi_name_resource
  name: 'scm'
  location: 'UK South'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
    'hidden-link: /app-insights-resource-id': '/subscriptions/{SubscriptionID}/resourceGroups/Opticut/providers/microsoft.insights/components/opticutapi'
  }
  properties: {
    allow: true
  }
}

resource sites_opticut_name_web 'Microsoft.Web/sites/config@2024-04-01' = {
  parent: sites_opticut_name_resource
  name: 'web'
  location: 'UK South'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
    'hidden-link: /app-insights-resource-id': '/subscriptions/{SubscriptionID}/resourceGroups/Opticut/providers/microsoft.insights/components/opticut'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v9.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: 'REDACTED'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetName: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_opticut-web-outbound-subnet'
    vnetRouteAllEnabled: true
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Enabled'
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 0
    azureStorageAccounts: {}
  }
}

resource sites_opticutapi_name_web 'Microsoft.Web/sites/config@2024-04-01' = {
  parent: sites_opticutapi_name_resource
  name: 'web'
  location: 'UK South'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
    'hidden-link: /app-insights-resource-id': '/subscriptions/{SubscriptionID}/resourceGroups/Opticut/providers/microsoft.insights/components/opticutapi'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v9.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2022'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$opticutapi'
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetName: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_opticut-outbound-subnet'
    vnetRouteAllEnabled: true
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Disabled'
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: true
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
}

resource sites_opticutapi_name_sites_opticutapi_name_dkadbxaucwhya2fa_uksouth_01_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2024-04-01' = {
  parent: sites_opticutapi_name_resource
  name: '${sites_opticutapi_name}-dkadbxaucwhya2fa.uksouth-01.azurewebsites.net'
  location: 'UK South'
  properties: {
    siteName: 'opticutapi'
    hostNameType: 'Verified'
  }
}

resource sites_opticut_name_sites_opticut_name_c6ctguaabqhcfsgq_uksouth_01_azurewebsites_net 'Microsoft.Web/sites/hostNameBindings@2024-04-01' = {
  parent: sites_opticut_name_resource
  name: '${sites_opticut_name}-c6ctguaabqhcfsgq.uksouth-01.azurewebsites.net'
  location: 'UK South'
  properties: {
    siteName: 'opticut'
    hostNameType: 'Verified'
  }
}

resource sites_opticutapi_name_opticut_app_endpoint_21116c34_121a_4dba_a2f1_64239ba2767a 'Microsoft.Web/sites/privateEndpointConnections@2024-04-01' = {
  parent: sites_opticutapi_name_resource
  name: 'opticut-app-endpoint-21116c34-121a-4dba-a2f1-64239ba2767a'
  location: 'UK South'
  properties: {
    privateEndpoint: {}
    privateLinkServiceConnectionState: {
      status: 'Approved'
      actionsRequired: 'None'
    }
    ipAddresses: [
      '10.0.0.4'
    ]
  }
}

resource privateDnsZones_privatelink_database_windows_net_name_link_6q3xciaohtx2o 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2024-06-01' = {
  parent: privateDnsZones_privatelink_database_windows_net_name_resource
  name: 'link-6q3xciaohtx2o'
  location: 'global'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    registrationEnabled: false
    resolutionPolicy: 'Default'
    virtualNetwork: {
      id: virtualNetworks_opticut_vnet_name_resource.id
    }
  }
}

resource privateDnsZones_privatelink_azurewebsites_net_name_opticutapi_link 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2024-06-01' = {
  parent: privateDnsZones_privatelink_azurewebsites_net_name_resource
  name: 'opticutapi-link'
  location: 'global'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    registrationEnabled: false
    resolutionPolicy: 'Default'
    virtualNetwork: {
      id: virtualNetworks_opticut_vnet_name_resource.id
    }
  }
}

resource privateEndpoints_endpoint_6q3xciaohtx2o_name_resource 'Microsoft.Network/privateEndpoints@2024-05-01' = {
  name: privateEndpoints_opticut_database_server_endpoint_name
  location: 'uksouth'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    privateLinkServiceConnections: [
      {
        name: privateEndpoints_opticut_database_server_endpoint_name
        id: '${privateEndpoints_endpoint_6q3xciaohtx2o_name_resource.id}/privateLinkServiceConnections/${privateEndpoints_opticut_database_server_endpoint_name}'
        properties: {
          privateLinkServiceId: servers_opticut_server_name_resource.id
          groupIds: [
            'sqlServer'
          ]
          privateLinkServiceConnectionState: {
            status: 'Approved'
            description: 'Auto-approved'
            actionsRequired: 'None'
          }
        }
      }
    ]
    manualPrivateLinkServiceConnections: []
    subnet: {
      id: virtualNetworks_opticut_vnet_name_subnet_6q3xciaohtx2o.id
    }
    ipConfigurations: []
    customDnsConfigs: []
  }
}

resource privateEndpoints_opticut_app_endpoint_name_resource 'Microsoft.Network/privateEndpoints@2024-05-01' = {
  name: privateEndpoints_opticut_app_endpoint_name
  location: 'uksouth'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    privateLinkServiceConnections: [
      {
        name: privateEndpoints_opticut_app_endpoint_name
        id: '${privateEndpoints_opticut_app_endpoint_name_resource.id}/privateLinkServiceConnections/${privateEndpoints_opticut_app_endpoint_name}'
        properties: {
          privateLinkServiceId: sites_opticutapi_name_resource.id
          groupIds: [
            'sites'
          ]
          privateLinkServiceConnectionState: {
            status: 'Approved'
            actionsRequired: 'None'
          }
        }
      }
    ]
    manualPrivateLinkServiceConnections: []
    subnet: {
      id: virtualNetworks_opticut_vnet_name_opticut_inbound_subnet.id
    }
    ipConfigurations: []
    customDnsConfigs: []
  }
}

resource privateEndpoints_endpoint_6q3xciaohtx2o_name_default 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2024-05-01' = {
  name: '${privateEndpoints_opticut_database_server_endpoint_name}/default'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink.database.windows.net'
        properties: {
          privateDnsZoneId: privateDnsZones_privatelink_database_windows_net_name_resource.id
        }
      }
    ]
  }
  dependsOn: [
    privateEndpoints_endpoint_6q3xciaohtx2o_name_resource
  ]
}

resource privateEndpoints_opticut_app_endpoint_name_default 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2024-05-01' = {
  name: '${privateEndpoints_opticut_app_endpoint_name}/default'
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'privatelink.azurewebsites.net-config'
        properties: {
          privateDnsZoneId: privateDnsZones_privatelink_azurewebsites_net_name_resource.id
        }
      }
    ]
  }
  dependsOn: [
    privateEndpoints_opticut_app_endpoint_name_resource
  ]
}

resource virtualNetworks_opticut_vnet_name_opticut_inbound_subnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${virtualNetworks_opticut_vnet_name}/opticut-inbound-subnet'
  properties: {
    addressPrefix: '10.0.0.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_opticut_inbound_nsg_name_resource.id
    }
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_opticut_vnet_name_resource
  ]
}

resource virtualNetworks_opticut_vnet_name_opticut_outbound_subnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${virtualNetworks_opticut_vnet_name}/opticut-outbound-subnet'
  properties: {
    addressPrefix: '10.0.1.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_opticut_outbound_nsg_name_resource.id
    }
    serviceEndpoints: []
    delegations: [
      {
        name: 'delegation'
        id: '${virtualNetworks_opticut_vnet_name_opticut_outbound_subnet.id}/delegations/delegation'
        properties: {
          serviceName: 'Microsoft.Web/serverfarms'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
      }
    ]
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_opticut_vnet_name_resource
  ]
}

resource virtualNetworks_opticut_vnet_name_opticut_web_inbound_subnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${virtualNetworks_opticut_vnet_name}/opticut-web-inbound-subnet'
  properties: {
    addressPrefix: '10.0.3.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_opticut_web_inbound_nsg_name_resource.id
    }
    delegations: [
      {
        name: 'Microsoft.Web/serverFarms'
        id: '${virtualNetworks_opticut_vnet_name_opticut_web_inbound_subnet.id}/delegations/Microsoft.Web/serverFarms'
        properties: {
          serviceName: 'Microsoft.Web/serverFarms'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
      }
    ]
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
    defaultOutboundAccess: false
  }
  dependsOn: [
    virtualNetworks_opticut_vnet_name_resource
  ]
}

resource virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${virtualNetworks_opticut_vnet_name}/opticut-web-outbound-subnet'
  properties: {
    addressPrefix: '10.0.4.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_opticut_web_outbound_nsg_name_resource.id
    }
    delegations: [
      {
        name: 'Microsoft.Web/serverFarms'
        id: '${virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet.id}/delegations/Microsoft.Web/serverFarms'
        properties: {
          serviceName: 'Microsoft.Web/serverFarms'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
      }
    ]
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_opticut_vnet_name_resource
  ]
}

resource virtualNetworks_opticut_vnet_name_subnet_6q3xciaohtx2o 'Microsoft.Network/virtualNetworks/subnets@2024-05-01' = {
  name: '${virtualNetworks_opticut_vnet_name}/subnet-6q3xciaohtx2o'
  properties: {
    addressPrefix: '10.0.2.0/24'
    networkSecurityGroup: {
      id: networkSecurityGroups_opticut_db_server_nsg_name_resource.id
    }
    serviceEndpoints: []
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_opticut_vnet_name_resource
  ]
}

resource servers_opticut_server_name_opticut_database_Default 'Microsoft.Sql/servers/databases/advancedThreatProtectionSettings@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'Default'
  properties: {
    state: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource servers_opticut_server_name_opticut_database_CreateIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'CreateIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource servers_opticut_server_name_opticut_database_DbParameterization 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'DbParameterization'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource servers_opticut_server_name_opticut_database_DefragmentIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'DefragmentIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource servers_opticut_server_name_opticut_database_DropIndex 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'DropIndex'
  properties: {
    autoExecuteValue: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource servers_opticut_server_name_opticut_database_ForceLastGoodPlan 'Microsoft.Sql/servers/databases/advisors@2014-04-01' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'ForceLastGoodPlan'
  properties: {
    autoExecuteValue: 'Enabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingPolicies_servers_opticut_server_name_opticut_database_Default 'Microsoft.Sql/servers/databases/auditingPolicies@2014-04-01' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'Default'
  location: 'UK South'
  properties: {
    auditingState: 'Disabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_auditingSettings_servers_opticut_server_name_opticut_database_Default 'Microsoft.Sql/servers/databases/auditingSettings@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupLongTermRetentionPolicies_servers_opticut_server_name_opticut_database_default 'Microsoft.Sql/servers/databases/backupLongTermRetentionPolicies@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'default'
  properties: {
    weeklyRetention: 'PT0S'
    monthlyRetention: 'PT0S'
    yearlyRetention: 'PT0S'
    weekOfYear: 0
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_backupShortTermRetentionPolicies_servers_opticut_server_name_opticut_database_default 'Microsoft.Sql/servers/databases/backupShortTermRetentionPolicies@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'default'
  properties: {
    retentionDays: 7
    diffBackupIntervalInHours: 12
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_extendedAuditingSettings_servers_opticut_server_name_opticut_database_Default 'Microsoft.Sql/servers/databases/extendedAuditingSettings@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'default'
  properties: {
    retentionDays: 0
    isAzureMonitorTargetEnabled: false
    state: 'Disabled'
    storageAccountSubscriptionId: '00000000-0000-0000-0000-000000000000'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_geoBackupPolicies_servers_opticut_server_name_opticut_database_Default 'Microsoft.Sql/servers/databases/geoBackupPolicies@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'Default'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource servers_opticut_server_name_opticut_database_Current 'Microsoft.Sql/servers/databases/ledgerDigestUploads@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'Current'
  properties: {}
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_securityAlertPolicies_servers_opticut_server_name_opticut_database_Default 'Microsoft.Sql/servers/databases/securityAlertPolicies@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'Default'
  properties: {
    state: 'Disabled'
    disabledAlerts: [
      ''
    ]
    emailAddresses: [
      ''
    ]
    emailAccountAdmins: false
    retentionDays: 0
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_transparentDataEncryption_servers_opticut_server_name_opticut_database_Current 'Microsoft.Sql/servers/databases/transparentDataEncryption@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'Current'
  properties: {
    state: 'Enabled'
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource Microsoft_Sql_servers_databases_vulnerabilityAssessments_servers_opticut_server_name_opticut_database_Default 'Microsoft.Sql/servers/databases/vulnerabilityAssessments@2024-05-01-preview' = {
  parent: servers_opticut_server_name_opticut_database
  name: 'Default'
  properties: {
    recurringScans: {
      isEnabled: false
      emailSubscriptionAdmins: true
    }
  }
  dependsOn: [
    servers_opticut_server_name_resource
  ]
}

resource servers_opticut_server_name_endpoint_6q3xciaohtx2o_7d36298a_c330_46dd_ae23_86f03c3b8702 'Microsoft.Sql/servers/privateEndpointConnections@2024-05-01-preview' = {
  parent: servers_opticut_server_name_resource
  name: 'opticut-database-server-endpoint-7d36298a-c330-46dd-ae23-86f03c3b8702'
  properties: {
    privateEndpoint: {
      id: privateEndpoints_endpoint_6q3xciaohtx2o_name_resource.id
    }
    privateLinkServiceConnectionState: {
      status: 'Approved'
      description: 'Auto-approved'
    }
  }
}

resource sites_opticut_name_resource 'Microsoft.Web/sites@2024-04-01' = {
  name: sites_opticut_name
  location: 'UK South'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
    'hidden-link: /app-insights-resource-id': '/subscriptions/{SubscriptionID}/resourceGroups/Opticut/providers/microsoft.insights/components/opticut'
  }
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_opticut_name}-c6ctguaabqhcfsgq.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_opticut_name}-c6ctguaabqhcfsgq.scm.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_OpticutAppServicePlan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    vnetRouteAllEnabled: true
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 0
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: true
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    vnetBackupRestoreEnabled: true
    customDomainVerificationId: '374F4E31B0747A3FC3EE545BAD3ABEF54B33224B179755308D1F9C19052A56FB'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    virtualNetworkSubnetId: resourceId(
      'Microsoft.Network/virtualNetworks/subnets',
      virtualNetworks_opticut_vnet_name,
      '${sites_opticut_name}-web-outbound-subnet'
    )
    keyVaultReferenceIdentity: 'SystemAssigned'
    autoGeneratedDomainNameLabelScope: 'TenantReuse'
  }
  dependsOn: [
    virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet
  ]
}

resource sites_opticutapi_name_resource 'Microsoft.Web/sites@2024-04-01' = {
  name: sites_opticutapi_name
  location: 'UK South'
  tags: {
    Framework: '.NET 9.0'
    Owner: 'Shiraz Adam'
    Project: 'Opticut'
    'hidden-link: /app-insights-resource-id': '/subscriptions/{SubscriptionID}/resourceGroups/Opticut/providers/microsoft.insights/components/opticutapi'
  }
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${sites_opticutapi_name}-dkadbxaucwhya2fa.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${sites_opticutapi_name}-dkadbxaucwhya2fa.scm.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_OpticutAppServicePlan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    vnetRouteAllEnabled: true
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: true
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    vnetBackupRestoreEnabled: false
    customDomainVerificationId: '374F4E31B0747A3FC3EE545BAD3ABEF54B33224B179755308D1F9C19052A56FB'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Disabled'
    storageAccountRequired: false
    virtualNetworkSubnetId: virtualNetworks_opticut_vnet_name_opticut_outbound_subnet.id
    keyVaultReferenceIdentity: 'SystemAssigned'
    autoGeneratedDomainNameLabelScope: 'TenantReuse'
  }
}

resource sites_opticut_name_deploymentslot_a_ftp 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_a
  name: 'ftp'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    allow: true
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource sites_opticut_name_deploymentslot_b_ftp 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_b
  name: 'ftp'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    allow: true
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource sites_opticutapi_name_deploymentslot_a_ftp 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_a
  name: 'ftp'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    allow: true
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticutapi_name_deploymentslot_b_ftp 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_b
  name: 'ftp'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    allow: true
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticut_name_deploymentslot_a_scm 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_a
  name: 'scm'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    allow: true
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource sites_opticut_name_deploymentslot_b_scm 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_b
  name: 'scm'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    allow: true
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource sites_opticutapi_name_deploymentslot_a_scm 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_a
  name: 'scm'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    allow: true
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticutapi_name_deploymentslot_b_scm 'Microsoft.Web/sites/slots/basicPublishingCredentialsPolicies@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_b
  name: 'scm'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    allow: true
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticut_name_deploymentslot_a_web 'Microsoft.Web/sites/slots/config@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_a
  name: 'web'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v9.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2022'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$opticut__deploymentslot-a'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetName: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_opticut-web-outbound-subnet'
    vnetRouteAllEnabled: true
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Enabled'
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource sites_opticut_name_deploymentslot_b_web 'Microsoft.Web/sites/slots/config@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_b
  name: 'web'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v9.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2022'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$opticut__deploymentslot-b'
    scmType: 'None'
    use32BitWorkerProcess: true
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetName: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_opticut-web-outbound-subnet'
    vnetRouteAllEnabled: true
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Enabled'
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: false
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource sites_opticutapi_name_deploymentslot_a_web 'Microsoft.Web/sites/slots/config@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_a
  name: 'web'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v9.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2022'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$opticutapi__deploymentslot-a'
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetName: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_opticut-outbound-subnet'
    vnetRouteAllEnabled: true
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Disabled'
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: true
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticutapi_name_deploymentslot_b_web 'Microsoft.Web/sites/slots/config@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_b
  name: 'web'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    numberOfWorkers: 1
    defaultDocuments: [
      'Default.htm'
      'Default.html'
      'Default.asp'
      'index.htm'
      'index.html'
      'iisstart.htm'
      'default.aspx'
      'index.php'
      'hostingstart.html'
    ]
    netFrameworkVersion: 'v9.0'
    requestTracingEnabled: false
    remoteDebuggingEnabled: false
    remoteDebuggingVersion: 'VS2022'
    httpLoggingEnabled: false
    acrUseManagedIdentityCreds: false
    logsDirectorySizeLimit: 35
    detailedErrorLoggingEnabled: false
    publishingUsername: '$opticutapi__deploymentslot-b'
    scmType: 'None'
    use32BitWorkerProcess: false
    webSocketsEnabled: false
    alwaysOn: true
    managedPipelineMode: 'Integrated'
    virtualApplications: [
      {
        virtualPath: '/'
        physicalPath: 'site\\wwwroot'
        preloadEnabled: true
      }
    ]
    loadBalancing: 'LeastRequests'
    experiments: {
      rampUpRules: []
    }
    autoHealEnabled: false
    vnetName: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_opticut-outbound-subnet'
    vnetRouteAllEnabled: true
    vnetPrivatePortsCount: 0
    publicNetworkAccess: 'Disabled'
    localMySqlEnabled: false
    ipSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictions: [
      {
        ipAddress: 'Any'
        action: 'Allow'
        priority: 2147483647
        name: 'Allow all'
        description: 'Allow all access'
      }
    ]
    scmIpSecurityRestrictionsUseMain: false
    http20Enabled: true
    minTlsVersion: '1.2'
    scmMinTlsVersion: '1.2'
    ftpsState: 'FtpsOnly'
    preWarmedInstanceCount: 0
    elasticWebAppScaleLimit: 0
    functionsRuntimeScaleMonitoringEnabled: false
    minimumElasticInstanceCount: 1
    azureStorageAccounts: {}
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticutapi_name_deploymentslot_a_sites_opticutapi_name_deploymentslot_a_avabbvg4e5fsgqb8_uksouth_01_azurewebsites_net 'Microsoft.Web/sites/slots/hostNameBindings@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_a
  name: '${sites_opticutapi_name}-deploymentslot-a-avabbvg4e5fsgqb8.uksouth-01.azurewebsites.net'
  location: 'UK South'
  properties: {
    siteName: 'opticutapi(deploymentslot-a)'
    hostNameType: 'Verified'
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticutapi_name_deploymentslot_b_sites_opticutapi_name_deploymentslot_b_d7a7hsg7fmgkbvh3_uksouth_01_azurewebsites_net 'Microsoft.Web/sites/slots/hostNameBindings@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_b
  name: '${sites_opticutapi_name}-deploymentslot-b-d7a7hsg7fmgkbvh3.uksouth-01.azurewebsites.net'
  location: 'UK South'
  properties: {
    siteName: 'opticutapi(deploymentslot-b)'
    hostNameType: 'Verified'
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticut_name_deploymentslot_a_sites_opticut_name_deploymentslot_a_bravb2h7hnf2euhr_uksouth_01_azurewebsites_net 'Microsoft.Web/sites/slots/hostNameBindings@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_a
  name: '${sites_opticut_name}-deploymentslot-a-bravb2h7hnf2euhr.uksouth-01.azurewebsites.net'
  location: 'UK South'
  properties: {
    siteName: 'opticut(deploymentslot-a)'
    hostNameType: 'Verified'
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource sites_opticut_name_deploymentslot_b_sites_opticut_name_deploymentslot_b_d0ayb9fnfpg8c5fv_uksouth_01_azurewebsites_net 'Microsoft.Web/sites/slots/hostNameBindings@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_b
  name: '${sites_opticut_name}-deploymentslot-b-d0ayb9fnfpg8c5fv.uksouth-01.azurewebsites.net'
  location: 'UK South'
  properties: {
    siteName: 'opticut(deploymentslot-b)'
    hostNameType: 'Verified'
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource sites_opticutapi_name_a9801e32_0c5c_44ec_9ec4_91ee1bdcfb9b_opticut_outbound_subnet 'Microsoft.Web/sites/virtualNetworkConnections@2024-04-01' = {
  parent: sites_opticutapi_name_resource
  name: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_opticut-outbound-subnet'
  location: 'UK South'
  properties: {
    vnetResourceId: virtualNetworks_opticut_vnet_name_opticut_outbound_subnet.id
    isSwift: true
  }
}

resource sites_opticut_name_a9801e32_0c5c_44ec_9ec4_91ee1bdcfb9b_sites_opticut_name_web_outbound_subnet 'Microsoft.Web/sites/virtualNetworkConnections@2024-04-01' = {
  parent: sites_opticut_name_resource
  name: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_${sites_opticut_name}-web-outbound-subnet'
  location: 'UK South'
  properties: {
    vnetResourceId: virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet.id
    isSwift: true
  }
}

resource sites_opticut_name_deploymentslot_a 'Microsoft.Web/sites/slots@2024-04-01' = {
  parent: sites_opticut_name_resource
  name: 'deploymentslot-a'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'opticut-deploymentslot-a-bravb2h7hnf2euhr.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'opticut-deploymentslot-a-bravb2h7hnf2euhr.scm.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_OpticutAppServicePlan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    vnetRouteAllEnabled: true
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: true
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    vnetBackupRestoreEnabled: false
    customDomainVerificationId: '374F4E31B0747A3FC3EE545BAD3ABEF54B33224B179755308D1F9C19052A56FB'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    virtualNetworkSubnetId: virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet.id
    keyVaultReferenceIdentity: 'SystemAssigned'
    autoGeneratedDomainNameLabelScope: 'TenantReuse'
  }
}

resource sites_opticutapi_name_deploymentslot_a 'Microsoft.Web/sites/slots@2024-04-01' = {
  parent: sites_opticutapi_name_resource
  name: 'deploymentslot-a'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'opticutapi-deploymentslot-a-avabbvg4e5fsgqb8.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'opticutapi-deploymentslot-a-avabbvg4e5fsgqb8.scm.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_OpticutAppServicePlan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    vnetRouteAllEnabled: true
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: true
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    vnetBackupRestoreEnabled: false
    customDomainVerificationId: '374F4E31B0747A3FC3EE545BAD3ABEF54B33224B179755308D1F9C19052A56FB'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Disabled'
    storageAccountRequired: false
    virtualNetworkSubnetId: virtualNetworks_opticut_vnet_name_opticut_outbound_subnet.id
    keyVaultReferenceIdentity: 'SystemAssigned'
    autoGeneratedDomainNameLabelScope: 'TenantReuse'
  }
}

resource sites_opticut_name_deploymentslot_b 'Microsoft.Web/sites/slots@2024-04-01' = {
  parent: sites_opticut_name_resource
  name: 'deploymentslot-b'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'opticut-deploymentslot-b-d0ayb9fnfpg8c5fv.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'opticut-deploymentslot-b-d0ayb9fnfpg8c5fv.scm.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_OpticutAppServicePlan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    vnetRouteAllEnabled: true
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: false
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: true
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    vnetBackupRestoreEnabled: false
    customDomainVerificationId: '374F4E31B0747A3FC3EE545BAD3ABEF54B33224B179755308D1F9C19052A56FB'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Enabled'
    storageAccountRequired: false
    virtualNetworkSubnetId: virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet.id
    keyVaultReferenceIdentity: 'SystemAssigned'
    autoGeneratedDomainNameLabelScope: 'TenantReuse'
  }
}

resource sites_opticutapi_name_deploymentslot_b 'Microsoft.Web/sites/slots@2024-04-01' = {
  parent: sites_opticutapi_name_resource
  name: 'deploymentslot-b'
  location: 'UK South'
  tags: {
    Owner: 'Shiraz Adam'
  }
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: 'opticutapi-deploymentslot-b-d7a7hsg7fmgkbvh3.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: 'opticutapi-deploymentslot-b-d7a7hsg7fmgkbvh3.scm.uksouth-01.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarms_OpticutAppServicePlan_name_resource.id
    reserved: false
    isXenon: false
    hyperV: false
    dnsConfiguration: {}
    vnetRouteAllEnabled: true
    vnetImagePullEnabled: false
    vnetContentShareEnabled: false
    siteConfig: {
      numberOfWorkers: 1
      acrUseManagedIdentityCreds: false
      alwaysOn: true
      http20Enabled: true
      functionAppScaleLimit: 0
      minimumElasticInstanceCount: 1
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: false
    clientCertEnabled: false
    clientCertMode: 'Required'
    hostNamesDisabled: false
    ipMode: 'IPv4'
    vnetBackupRestoreEnabled: false
    customDomainVerificationId: '374F4E31B0747A3FC3EE545BAD3ABEF54B33224B179755308D1F9C19052A56FB'
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: true
    endToEndEncryptionEnabled: false
    redundancyMode: 'None'
    publicNetworkAccess: 'Disabled'
    storageAccountRequired: false
    virtualNetworkSubnetId: virtualNetworks_opticut_vnet_name_opticut_outbound_subnet.id
    keyVaultReferenceIdentity: 'SystemAssigned'
    autoGeneratedDomainNameLabelScope: 'TenantReuse'
  }
}

resource sites_opticutapi_name_deploymentslot_a_a9801e32_0c5c_44ec_9ec4_91ee1bdcfb9b_opticut_outbound_subnet 'Microsoft.Web/sites/slots/virtualNetworkConnections@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_a
  name: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_opticut-outbound-subnet'
  location: 'UK South'
  properties: {
    vnetResourceId: virtualNetworks_opticut_vnet_name_opticut_outbound_subnet.id
    isSwift: true
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticutapi_name_deploymentslot_b_a9801e32_0c5c_44ec_9ec4_91ee1bdcfb9b_opticut_outbound_subnet 'Microsoft.Web/sites/slots/virtualNetworkConnections@2024-04-01' = {
  parent: sites_opticutapi_name_deploymentslot_b
  name: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_opticut-outbound-subnet'
  location: 'UK South'
  properties: {
    vnetResourceId: virtualNetworks_opticut_vnet_name_opticut_outbound_subnet.id
    isSwift: true
  }
  dependsOn: [
    sites_opticutapi_name_resource
  ]
}

resource sites_opticut_name_deploymentslot_a_a9801e32_0c5c_44ec_9ec4_91ee1bdcfb9b_sites_opticut_name_web_outbound_subnet 'Microsoft.Web/sites/slots/virtualNetworkConnections@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_a
  name: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_${sites_opticut_name}-web-outbound-subnet'
  location: 'UK South'
  properties: {
    vnetResourceId: virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet.id
    isSwift: true
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource sites_opticut_name_deploymentslot_b_a9801e32_0c5c_44ec_9ec4_91ee1bdcfb9b_sites_opticut_name_web_outbound_subnet 'Microsoft.Web/sites/slots/virtualNetworkConnections@2024-04-01' = {
  parent: sites_opticut_name_deploymentslot_b
  name: 'a9801e32-0c5c-44ec-9ec4-91ee1bdcfb9b_${sites_opticut_name}-web-outbound-subnet'
  location: 'UK South'
  properties: {
    vnetResourceId: virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet.id
    isSwift: true
  }
  dependsOn: [
    sites_opticut_name_resource
  ]
}

resource virtualNetworks_opticut_vnet_name_resource 'Microsoft.Network/virtualNetworks@2024-05-01' = {
  name: virtualNetworks_opticut_vnet_name
  location: 'uksouth'
  tags: {
    Owner: 'Shiraz Adam'
  }
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    privateEndpointVNetPolicies: 'Disabled'
    subnets: [
      {
        name: 'subnet-6q3xciaohtx2o'
        id: virtualNetworks_opticut_vnet_name_subnet_6q3xciaohtx2o.id
        properties: {
          addressPrefix: '10.0.2.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_opticut_db_server_nsg_name_resource.id
          }
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'opticut-inbound-subnet'
        id: virtualNetworks_opticut_vnet_name_opticut_inbound_subnet.id
        properties: {
          addressPrefix: '10.0.0.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_opticut_inbound_nsg_name_resource.id
          }
          serviceEndpoints: []
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'opticut-outbound-subnet'
        id: virtualNetworks_opticut_vnet_name_opticut_outbound_subnet.id
        properties: {
          addressPrefix: '10.0.1.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_opticut_outbound_nsg_name_resource.id
          }
          serviceEndpoints: []
          delegations: [
            {
              name: 'delegation'
              id: '${virtualNetworks_opticut_vnet_name_opticut_outbound_subnet.id}/delegations/delegation'
              properties: {
                serviceName: 'Microsoft.Web/serverfarms'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'opticut-web-inbound-subnet'
        id: virtualNetworks_opticut_vnet_name_opticut_web_inbound_subnet.id
        properties: {
          addressPrefix: '10.0.3.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_opticut_web_inbound_nsg_name_resource.id
          }
          delegations: [
            {
              name: 'Microsoft.Web/serverFarms'
              id: '${virtualNetworks_opticut_vnet_name_opticut_web_inbound_subnet.id}/delegations/Microsoft.Web/serverFarms'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
          defaultOutboundAccess: false
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
      {
        name: 'opticut-web-outbound-subnet'
        id: virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet.id
        properties: {
          addressPrefix: '10.0.4.0/24'
          networkSecurityGroup: {
            id: networkSecurityGroups_opticut_web_outbound_nsg_name_resource.id
          }
          delegations: [
            {
              name: 'Microsoft.Web/serverFarms'
              id: '${virtualNetworks_opticut_vnet_name_opticut_web_outbound_subnet.id}/delegations/Microsoft.Web/serverFarms'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
              type: 'Microsoft.Network/virtualNetworks/subnets/delegations'
            }
          ]
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: []
    enableDdosProtection: false
  }
}
