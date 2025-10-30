@isTest
private class PowerContractsSelectorTest {
  @isTest
  static void newInstance() {
    Object instance = PowerContractsSelector.newInstance();
    System.assert(instance instanceof PowerContractsSelector);
  }

  @isTest
  static void selectById() {
    List<Power_Contract__c> origin = PowerContractTestDataFactory.create(2);
    Power_Contract__c source = PowerContractsSelector.newInstance()
      .selectById(origin[0].Id);
    System.assertEquals(origin[0].Id, source.Id);
  }

  @isTest
  static void selectByIds() {
    List<Power_Contract__c> origin = PowerContractTestDataFactory.create(2);
    List<Power_Contract__c> source = PowerContractsSelector.newInstance()
      .selectByIds(new Map<Id, Power_Contract__c>(origin).keySet());
    System.assertEquals(origin.size(), source.size());
  }

  @isTest
  static void selectByServiceAreaCodes() {
    // 生成したレコード
    List<Power_Contract__c> records = PowerContractTestDataFactory.create(2);
    // 供給地点特定番号項目を取得するため、SELECTする
    List<Power_Contract__c> origin = PowerContractsSelector.newInstance()
      .selectByIds(new Map<Id, Power_Contract__c>(records).keySet());
    List<Power_Contract__c> source = PowerContractsSelector.newInstance()
      .selectByServiceAreaCodes(
        new Set<String>{ origin[0].supply_point_identification_no__c }
      );
    System.assertEquals(origin[0].Id, source[0].Id);
  }

  @isTest
  static void selectByPowerDetailId() {
    // 明細(動力)を生成する
    List<Detail_P__c> childs = PowerDetailTestDataFactory.create(2);
    // 動力契約を取得する
    Power_Contract__c source = PowerContractsSelector.newInstance()
      .selectByPowerDetailId(childs[0].Id);
    System.assertEquals(childs[0].power_contract_id__c, source.Id);
  }

  @isTest
  static void selectByPowerDetailIds() {
    // 明細(動力)を生成する
    List<Detail_P__c> childs = PowerDetailTestDataFactory.create(2);
    // 動力契約を取得する
    List<Power_Contract__c> source = PowerContractsSelector.newInstance()
      .selectByPowerDetailIds(new Map<Id, Detail_P__c>(childs).keySet());
    System.assertEquals(childs[0].power_contract_id__c, source[0].Id);
    System.assertEquals(childs[1].power_contract_id__c, source[0].Id);
  }
}