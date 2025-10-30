@isTest
private class ElectricalAddressesControllerTest {
  @isTest
  static void getElectricalContracts() {
    // 契約者情報を生成する
    Contractor_Information__c parent = ContractorInformationTestDataFactory.create(
      1
    )[0];
    // 電気契約を生成する
    Electrical_Contract__c origin = ElectricalContractTestDataFactory.create(parent.Id, 1)[0];
    List<AggregateResult> source = ElectricalAddressesController.getElectricalContracts(
      parent.Id
    );

    System.assertEquals(
      origin.supply_point_identification_no__c,
      source[0].get('supply_point_identification_no__c')
    );
  }
}