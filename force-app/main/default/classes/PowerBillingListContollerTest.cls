@isTest
private class PowerBillingListContollerTest {
  @isTest
  static void getBillings() {
    // 明細(動力)を生成する
    List<Detail_P__c> origin = PowerDetailTestDataFactory.create(2);
    // 動力契約
    Power_Contract__c contract = PowerContractsSelector.newInstance()
      .selectById(origin[0].power_contract_id__c);

    PowerBillingListContoller.Filters filters = new PowerBillingListContoller.Filters();
    filters.startDate = origin[0].billing_date__c;
    filters.endDate = origin[0].billing_date__c;
    filters.serviceAreaCode = contract.supply_point_identification_no__c;

    // 明細(動力)を取得する
    List<Detail_P__c> billings = PowerBillingListContoller.getBillings(filters);

    System.assertEquals(
      1,
      billings.size(),
      '取得レコードが絞り込まれていること'
    );
  }

  @isTest
  static void getBillingsError() {
    // 明細(動力)を生成する
    List<Detail_P__c> origin = PowerDetailTestDataFactory.create(2);

    Exception error;
    try {
      // 明細(動力)を取得する
      List<Detail_P__c> billings = PowerBillingListContoller.getBillings(null);
    } catch (Exception e) {
      error = e;
    }

    System.assert(
      error instanceof IllegalArgumentException,
      '不正な引数が指定エラー発生確認'
    );
  }
}