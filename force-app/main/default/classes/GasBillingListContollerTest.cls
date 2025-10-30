@isTest
private class GasBillingListContollerTest {
  @isTest
  static void getBillings() {
    // 明細(ガス)を生成する
    List<Detail_G__c> origin = GasDetailTestDataFactory.create(2);
    // ガス契約
    Gas_Contract__c contract = GasContractsSelector.newInstance()
      .selectById(origin[0].gas_contract_id__c);

    GasBillingListContoller.Filters filters = new GasBillingListContoller.Filters();
    filters.startDate = origin[0].billing_date__c;
    filters.endDate = origin[0].billing_date__c;
    filters.serviceAreaCode = contract.supply_point_identification_no__c;

    // 明細(ガス)を取得する
    List<Detail_G__c> billings = GasBillingListContoller.getBillings(filters);

    System.assertEquals(
      1,
      billings.size(),
      '取得レコードが絞り込まれていること'
    );
  }

  @isTest
  static void getBillingsError() {
    // 明細(ガス)を生成する
    List<Detail_G__c> origin = GasDetailTestDataFactory.create(2);

    Exception error;
    try {
      // 明細(ガス)を取得する
      List<Detail_G__c> billings = GasBillingListContoller.getBillings(null);
    } catch (Exception e) {
      error = e;
    }

    System.assert(
      error instanceof IllegalArgumentException,
      '不正な引数が指定エラー発生確認'
    );
  }
}