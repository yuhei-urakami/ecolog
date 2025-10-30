@isTest
public class GasDetailTestDataFactory {
  public static List<Detail_G__c> create(Integer num) {
    List<Gas_Contract__c> parents = GasContactTestDataFactory.create(1);
    List<Detail__c> parents2 = DetailTestDataFactory.create(1);
    List<Detail_G__c> records = new List<Detail_G__c>();
    for (Integer i = 0; i < num; i++) {
      Detail_G__c record = new Detail_G__c();
      record.gas_contract_id__c = parents[0].id;
      record.billing_date__c = Datetime.now().addMonths(i).format('yyyyMM');
      record.amount_to_use__c = i;
      record.meter_reading_date__c = Date.today().addDays(i);
      record.number_of_instructions_lt__c = i;
      record.number_of_instructions_tt__c = i;
      record.basic_charge__c = i;  
      record.pay_fee__c = i;
      record.Detail__c = parents2[0].id;
      records.add(record);
    }
    insert records;
    return records;
  }
}