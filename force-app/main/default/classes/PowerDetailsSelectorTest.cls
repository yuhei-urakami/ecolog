@isTest
private class PowerDetailsSelectorTest {
  @isTest
  static void newInstance() {
    Object instance = PowerContractsSelector.newInstance();
    System.assert(instance instanceof PowerContractsSelector);
  }

  @isTest
  static void selectByPowerContractIds() {
    // 明細(動力)を生成する
    List<Detail_P__c> origin = PowerDetailTestDataFactory.create(2);
    List<Detail_P__c> source = PowerDetailsSelector.newInstance()
      .selectByPowerContractIds(new Set<Id>{ origin[0].power_contract_id__c });
    System.assertEquals(origin.size(), source.size());
  }
}