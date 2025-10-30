public with sharing class NotificationController {
  @AuraEnabled(cacheable=true)
  public static List<notification__c> getNotifications(Integer lineNumber) {
    return [
      SELECT Id, Name, notification_date__c
      FROM notification__c
      WITH SECURITY_ENFORCED
      ORDER BY notification_date__c DESC
      LIMIT :lineNumber
    ];
  }
}