@isTest
private class ElectricalBillingFilterControllerTest {
  @isTest
  static void getElectricalContract() {
    // 電気契約を生成する
    Electrical_Contract__c origin = ElectricalContractTestDataFactory.create(1)[0];
    Electrical_Contract__c source = ElectricalBillingFilterController.getElectricalContract(
      origin.Id
    );
    System.assertEquals(origin.Id, source.Id);
  }
}