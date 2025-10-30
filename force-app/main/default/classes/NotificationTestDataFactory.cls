@isTest
public class NotificationTestDataFactory {
  public static List<notification__c> create(Integer num) {
    List<notification__c> records = new List<notification__c>();
    for (Integer i = 0; i < num; i++) {
        notification__c record = new notification__c(Name = 'Name' + i);
        records.add(record);
    }
    insert records;
    return records;
  }
}