@isTest
private class GasContractsSelectorTest {
  @isTest
  static void newInstance() {
    Object instance = GasContractsSelector.newInstance();
    System.assert(instance instanceof GasContractsSelector);
  }

  @isTest
  static void selectById() {
    List<Gas_Contract__c> origin = GasContractTestDataFactory.create(2);
    Gas_Contract__c source = GasContractsSelector.newInstance()
      .selectById(origin[0].Id);
    System.assertEquals(origin[0].Id, source.Id);
  }

  @isTest
  static void selectByIds() {
    List<Gas_Contract__c> origin = GasContractTestDataFactory.create(2);
    List<Gas_Contract__c> source = GasContractsSelector.newInstance()
      .selectByIds(new Map<Id, Gas_Contract__c>(origin).keySet());
    System.assertEquals(origin.size(), source.size());
  }

  @isTest
  static void selectByServiceAreaCodes() {
    // 生成したレコード
    List<Gas_Contract__c> records = GasContractTestDataFactory.create(2);
    // 供給地点特定番号項目を取得するため、SELECTする
    List<Gas_Contract__c> origin = GasContractsSelector.newInstance()
      .selectByIds(new Map<Id, Gas_Contract__c>(records).keySet());
    List<Gas_Contract__c> source = GasContractsSelector.newInstance()
      .selectByServiceAreaCodes(
        new Set<String>{ origin[0].supply_point_identification_no__c }
      );
    System.assertEquals(origin[0].Id, source[0].Id);
  }

  @isTest
  static void selectByGasDetailId() {
    // 明細(ガス)を生成する
    List<Detail_G__c> childs = GasDetailTestDataFactory.create(2);
    // ガス契約を取得する
    Gas_Contract__c source = GasContractsSelector.newInstance()
      .selectByGasDetailId(childs[0].Id);
    System.assertEquals(childs[0].gas_contract_id__c, source.Id);
  }

  @isTest
  static void selectByGasDetailIds() {
    // 明細(ガス)を生成する
    List<Detail_G__c> childs = GasDetailTestDataFactory.create(2);
    // ガス契約を取得する
    List<Gas_Contract__c> source = GasContractsSelector.newInstance()
      .selectByGasDetailIds(new Map<Id, Detail_G__c>(childs).keySet());
    System.assertEquals(childs[0].gas_contract_id__c, source[0].Id);
    System.assertEquals(childs[1].gas_contract_id__c, source[0].Id);
  }
}