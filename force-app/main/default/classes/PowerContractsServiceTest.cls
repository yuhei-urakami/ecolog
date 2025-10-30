@isTest
private class PowerContractsServiceTest {
  @isTest
  static void getPowerContract() {
    // 動力契約を生成する
    Power_Contract__c origin = PowerContractTestDataFactory.create(1)[0];
    Power_Contract__c source = PowerContractsService.getPowerContract(origin.Id);
    System.assertEquals(origin.Id, source.Id);
  }

  @isTest
  static void getBillingsByAreaCode() {
    // 明細(動力)を生成する
    List<Detail_P__c> origin = PowerDetailTestDataFactory.create(2);
    // 動力契約を取得する
    Power_Contract__c contract = PowerContractsSelector.newInstance()
      .selectById(origin[0].power_contract_id__c);
    List<Detail_P__c> source = PowerContractsService.getBillingsByAreaCode(
      contract.supply_point_identification_no__c
    );
    System.assertEquals(origin.size(), source.size());
  }
}