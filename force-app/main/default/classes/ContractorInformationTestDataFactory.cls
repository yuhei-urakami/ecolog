@isTest
public class ContractorInformationTestDataFactory {
  public static List<Contractor_Information__c> create(Integer num) {
    List<Application_Information__c> parents = ApplicationInformationTestDataFactory.create(
      1
    );

    List<Contractor_Information__c> records = new List<Contractor_Information__c>();
    for (Integer i = 0; i < num; i++) {
      Contractor_Information__c record = new Contractor_Information__c(
        application_information__c = parents[0].Id
      );
      records.add(record);
    }
    insert records;
    return records;
  }
}