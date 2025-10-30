@isTest
public class PowerContractTestDataFactory {
  public static List<Power_Contract__c> create(Integer num) {
    List<Contractor_Information__c> parents = ContractorInformationTestDataFactory.create(
      1
    );
    List<Power_Contract__c> records = new List<Power_Contract__c>();
    for (Integer i = 0; i < num; i++) {
      Power_Contract__c record = new Power_Contract__c();
      record.contractor_information__c = parents[0].id;
      record.customer_no__c = String.valueOf(i).leftPad(10, '0');
      record.supply_point_identification_no__c = String.valueOf(i)
        .leftPad(17, '0');
      records.add(record);
    }
    insert records;
    return records;
  }

  public static List<Power_Contract__c> create(Id parentId, Integer num) {
    List<Power_Contract__c> records = new List<Power_Contract__c>();
    for (Integer i = 0; i < num; i++) {
      Power_Contract__c record = new Power_Contract__c();
      record.contractor_information__c = parentId;
      record.customer_no__c = String.valueOf(i).leftPad(10, '0');
      record.supply_point_identification_no__c = String.valueOf(i)
        .leftPad(17, '0');
      records.add(record);
    }
    insert records;
    return records;
  }
}