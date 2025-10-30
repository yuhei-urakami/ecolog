@isTest
private class PowerDetailsServiceTest {
  @isTest
  static void getContract() {
    // 明細(動力)を生成する
    Detail_P__c detail = PowerDetailTestDataFactory.create(1)[0];
    Power_Contract__c contract = PowerDetailsService.getContract(detail.Id);
    System.assertEquals(detail.power_contract_id__c, contract.Id);
  }
}