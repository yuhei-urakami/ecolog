@isTest
private class GasBillingDetailControllerTest {
  @isTest
  static void getContract() {
    // 明細(ガス)を生成する
    Detail_G__c detail = GasDetailTestDataFactory.create(1)[0];
    Gas_Contract__c contract = GasBillingDetailController.getContract(
      detail.Id
    );
    System.assertEquals(detail.gas_contract_id__c, contract.Id);
  }

  @isTest
  static void getBillings() {
    // 明細(ガス)を生成する
    List<Detail_G__c> origin = GasDetailTestDataFactory.create(2);
    // ガス契約を取得する
    Gas_Contract__c contract = GasContractsSelector.newInstance()
      .selectById(origin[0].gas_contract_id__c);
    List<Detail_G__c> source = GasBillingDetailController.getBillings(
      contract.supply_point_identification_no__c
    );
    System.assertEquals(origin.size(), source.size());
  }
}