@isTest
private class PowerAddressesControllerTest {
  @isTest
  static void getPowerContracts() {
    // 契約者情報を生成する
    Contractor_Information__c parent = ContractorInformationTestDataFactory.create(
      1
    )[0];
    // 動力契約を生成する
    Power_Contract__c origin = PowerContractTestDataFactory.create(parent.Id, 1)[0];
    List<AggregateResult> source = PowerAddressesController.getPowerContracts(
      parent.Id
    );

    System.assertEquals(
      origin.supply_point_identification_no__c,
      source[0].get('supply_point_identification_no__c')
    );
  }
}