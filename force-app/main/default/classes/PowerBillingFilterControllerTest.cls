@isTest
private class PowerBillingFilterControllerTest {
  @isTest
  static void getPowerContract() {
    // 動力契約を生成する
    Power_Contract__c origin = PowerContractTestDataFactory.create(1)[0];
    Power_Contract__c source = PowerBillingFilterController.getPowerContract(
      origin.Id
    );
    System.assertEquals(origin.Id, source.Id);
  }
}