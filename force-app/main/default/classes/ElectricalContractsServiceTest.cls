@isTest
private class ElectricalContractsServiceTest {
  @isTest
  static void getElectricalContract() {
    // 電気契約を生成する
    Electrical_Contract__c origin = ElectricalContractTestDataFactory.create(1)[0];
    Electrical_Contract__c source = ElectricalContractsService.getElectricalContract(origin.Id);
    System.assertEquals(origin.Id, source.Id);
  }

  @isTest
  static void getBillingsByAreaCode() {
    // 明細(電気)を生成する
    List<Detail_E__c> origin = ElectricalDetailTestDataFactory.create(2);
    // 電気契約を取得する
    Electrical_Contract__c contract = ElectricalContractsSelector.newInstance()
      .selectById(origin[0].denki_contract_id__c);
    List<Detail_E__c> source = ElectricalContractsService.getBillingsByAreaCode(
      contract.supply_point_identification_no__c
    );
    System.assertEquals(origin.size(), source.size());
  }
}