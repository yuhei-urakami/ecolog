@isTest
private class GasDetailsSelectorTest {
  @isTest
  static void newInstance() {
    Object instance = GasContractsSelector.newInstance();
    System.assert(instance instanceof GasContractsSelector);
  }

  @isTest
  static void selectByGasContractIds() {
    // 明細(ガス)を生成する
    List<Detail_G__c> origin = GasDetailTestDataFactory.create(2);
    List<Detail_G__c> source = GasDetailsSelector.newInstance()
      .selectByGasContractIds(new Set<Id>{ origin[0].gas_contract_id__c });
    System.assertEquals(origin.size(), source.size());
  }
}