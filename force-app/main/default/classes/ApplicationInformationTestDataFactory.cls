@isTest
public class ApplicationInformationTestDataFactory {
  public static List<Application_Information__c>  create(Integer num) {
    List<Application_Information__c> records = new List<Application_Information__c>();
    for (Integer i = 0; i < num; i++) {
      Application_Information__c record = new Application_Information__c();
      records.add(record);
    }
    insert records;
    return records;
  }
}