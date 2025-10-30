@isTest
private class ElectricalDetailsSelectorTest {
  @isTest
  static void newInstance() {
    Object instance = ElectricalContractsSelector.newInstance();
    System.assert(instance instanceof ElectricalContractsSelector);
  }

  @isTest
  static void selectByElectricalContractIds() {
    // 明細(電気)を生成する
    List<Detail_E__c> origin = ElectricalDetailTestDataFactory.create(2);
    List<Detail_E__c> source = ElectricalDetailsSelector.newInstance()
      .selectByElectricalContractIds(new Set<Id>{ origin[0].denki_contract_id__c });
    System.assertEquals(origin.size(), source.size());
  }
}