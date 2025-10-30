@isTest
public class DetailTestDataFactory {
  public static List<Detail__c>  create(Integer num) {
    List<Contractor_Information__c> parents = ContractorInformationTestDataFactory.create(
      1
    );
    List<Detail__c> records = new List<Detail__c>();
    for (Integer i = 0; i < num; i++) {
      Detail__c record = new Detail__c();
      record.contractor_information__c = parents[0].id;
      records.add(record);
    }
    insert records;
    return records;
  }
}