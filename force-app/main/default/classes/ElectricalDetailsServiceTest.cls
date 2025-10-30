@isTest
private class ElectricalDetailsServiceTest {
  @isTest
  static void getContract() {
    // 明細(電気)を生成する
    Detail_E__c detail = ElectricalDetailTestDataFactory.create(1)[0];
    Electrical_Contract__c contract = ElectricalDetailsService.getContract(detail.Id);
    System.assertEquals(detail.denki_contract_id__c, contract.Id);
  }
}