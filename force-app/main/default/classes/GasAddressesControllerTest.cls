@isTest
private class GasAddressesControllerTest {
  @isTest
  static void getGasContracts() {
    // 契約者情報を生成する
    Contractor_Information__c parent = ContractorInformationTestDataFactory.create(
      1
    )[0];
    // ガス契約を生成する
    Gas_Contract__c origin = GasContractTestDataFactory.create(parent.Id, 1)[0];
    List<AggregateResult> source = GasAddressesController.getGasContracts(
      parent.Id
    );

    System.assertEquals(
      origin.supply_point_identification_no__c,
      source[0].get('supply_point_identification_no__c')
    );
  }
}