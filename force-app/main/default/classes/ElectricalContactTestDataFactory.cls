@isTest
public class ElectricalContactTestDataFactory {
  public static List<Electrical_Contract__c> create(Integer num) {
    List<Contractor_Information__c> parents = ContractorInformationTestDataFactory.create(
      1
    );
    List<Electrical_Contract__c> records = new List<Electrical_Contract__c>();
    for (Integer i = 0; i < num; i++) {
      Electrical_Contract__c record = new Electrical_Contract__c();
      record.contractor_information__c = parents[0].id;
      record.customer_no__c = String.valueOf(i).leftPad(10, '0');
      record.supply_point_identification_no__c = String.valueOf(i)
        .leftPad(17, '0');
      records.add(record);
    }
    insert records;
    return records;
  }
}