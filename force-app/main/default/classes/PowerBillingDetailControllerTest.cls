@isTest
private class PowerBillingDetailControllerTest {
  @isTest
  static void getContract() {
    // 明細(動力)を生成する
    Detail_P__c detail = PowerDetailTestDataFactory.create(1)[0];
    Power_Contract__c contract = PowerBillingDetailController.getContract(
      detail.Id
    );
    System.assertEquals(detail.power_contract_id__c, contract.Id);
  }

  @isTest
  static void getBillings() {
    // 明細(動力)を生成する
    List<Detail_P__c> origin = PowerDetailTestDataFactory.create(2);
    // 動力契約を取得する
    Power_Contract__c contract = PowerContractsSelector.newInstance()
      .selectById(origin[0].power_contract_id__c);
    List<Detail_P__c> source = PowerBillingDetailController.getBillings(
      contract.supply_point_identification_no__c
    );
    System.assertEquals(origin.size(), source.size());
  }
}