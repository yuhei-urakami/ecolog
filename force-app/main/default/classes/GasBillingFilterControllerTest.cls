@isTest
private class GasBillingFilterControllerTest {
  @isTest
  static void getGasContract() {
    // ガス契約を生成する
    Gas_Contract__c origin = GasContractTestDataFactory.create(1)[0];
    Gas_Contract__c source = GasBillingFilterController.getGasContract(
      origin.Id
    );
    System.assertEquals(origin.Id, source.Id);
  }
}