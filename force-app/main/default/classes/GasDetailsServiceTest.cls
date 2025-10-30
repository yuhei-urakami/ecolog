@isTest
private class GasDetailsServiceTest {
  @isTest
  static void getContract() {
    // 明細(ガス)を生成する
    Detail_G__c detail = GasDetailTestDataFactory.create(1)[0];
    Gas_Contract__c contract = GasDetailsService.getContract(detail.Id);
    System.assertEquals(detail.gas_contract_id__c, contract.Id);
  }
}