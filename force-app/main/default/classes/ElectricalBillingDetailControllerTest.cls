@isTest
private class ElectricalBillingDetailControllerTest {
  @isTest
  static void getContract() {
    // 明細(電気)を生成する
    Detail_E__c detail = ElectricalDetailTestDataFactory.create(1)[0];
    Electrical_Contract__c contract = ElectricalBillingDetailController.getContract(
      detail.Id
    );
    System.assertEquals(detail.denki_contract_id__c, contract.Id);
  }

  @isTest
  static void getBillings() {
    // 明細(電気)を生成する
    List<Detail_E__c> origin = ElectricalDetailTestDataFactory.create(2);
    // 電気契約を取得する
    Electrical_Contract__c contract = ElectricalContractsSelector.newInstance()
      .selectById(origin[0].denki_contract_id__c);
    List<Detail_E__c> source = ElectricalBillingDetailController.getBillings(
      contract.supply_point_identification_no__c
    );
    System.assertEquals(origin.size(), source.size());
  }
}