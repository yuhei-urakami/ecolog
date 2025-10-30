@isTest
private class ElectricalContractsSelectorTest {
  @isTest
  static void newInstance() {
    Object instance = ElectricalContractsSelector.newInstance();
    System.assert(instance instanceof ElectricalContractsSelector);
  }

  @isTest
  static void selectById() {
    List<Electrical_Contract__c> origin = ElectricalContractTestDataFactory.create(2);
    Electrical_Contract__c source = ElectricalContractsSelector.newInstance()
      .selectById(origin[0].Id);
    System.assertEquals(origin[0].Id, source.Id);
  }

  @isTest
  static void selectByIds() {
    List<Electrical_Contract__c> origin = ElectricalContractTestDataFactory.create(2);
    List<Electrical_Contract__c> source = ElectricalContractsSelector.newInstance()
      .selectByIds(new Map<Id, Electrical_Contract__c>(origin).keySet());
    System.assertEquals(origin.size(), source.size());
  }

  @isTest
  static void selectByServiceAreaCodes() {
    // 生成したレコード
    List<Electrical_Contract__c> records = ElectricalContractTestDataFactory.create(2);
    // 供給地点特定番号項目を取得するため、SELECTする
    List<Electrical_Contract__c> origin = ElectricalContractsSelector.newInstance()
      .selectByIds(new Map<Id, Electrical_Contract__c>(records).keySet());
    List<Electrical_Contract__c> source = ElectricalContractsSelector.newInstance()
      .selectByServiceAreaCodes(
        new Set<String>{ origin[0].supply_point_identification_no__c }
      );
    System.assertEquals(origin[0].Id, source[0].Id);
  }

  @isTest
  static void selectByElectricalDetailId() {
    // 明細(電気)を生成する
    List<Detail_E__c> childs = ElectricalDetailTestDataFactory.create(2);
    // 電気契約を取得する
    Electrical_Contract__c source = ElectricalContractsSelector.newInstance()
      .selectByElectricalDetailId(childs[0].Id);
    System.assertEquals(childs[0].denki_contract_id__c, source.Id);
  }

  @isTest
  static void selectByElectricalDetailIds() {
    // 明細(電気)を生成する
    List<Detail_E__c> childs = ElectricalDetailTestDataFactory.create(2);
    // 電気契約を取得する
    List<Electrical_Contract__c> source = ElectricalContractsSelector.newInstance()
      .selectByElectricalDetailIds(new Map<Id, Detail_E__c>(childs).keySet());
    System.assertEquals(childs[0].denki_contract_id__c, source[0].Id);
    System.assertEquals(childs[1].denki_contract_id__c, source[0].Id);
  }
}