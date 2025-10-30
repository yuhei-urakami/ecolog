@isTest
private class GasContractsServiceTest {
  @isTest
  static void getGasContract() {
    // ガス契約を生成する
    Gas_Contract__c origin = GasContractTestDataFactory.create(1)[0];
    Gas_Contract__c source = GasContractsService.getGasContract(origin.Id);
    System.assertEquals(origin.Id, source.Id);
  }

  @isTest
  static void getBillingsByAreaCode() {
    // 明細(ガス)を生成する
    List<Detail_G__c> origin = GasDetailTestDataFactory.create(2);
    // ガス契約を取得する
    Gas_Contract__c contract = GasContractsSelector.newInstance()
      .selectById(origin[0].gas_contract_id__c);
    List<Detail_G__c> source = GasContractsService.getBillingsByAreaCode(
      contract.supply_point_identification_no__c
    );
    System.assertEquals(origin.size(), source.size());
  }
}