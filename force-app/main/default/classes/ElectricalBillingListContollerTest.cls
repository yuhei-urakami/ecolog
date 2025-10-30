@isTest
private class ElectricalBillingListContollerTest {
  @isTest
  static void getBillings() {
    // 明細(電気)を生成する
    List<Detail_E__c> origin = ElectricalDetailTestDataFactory.create(2);
    // 電気契約
    Electrical_Contract__c contract = ElectricalContractsSelector.newInstance()
      .selectById(origin[0].denki_contract_id__c);

    ElectricalBillingListContoller.Filters filters = new ElectricalBillingListContoller.Filters();
    filters.startDate = origin[0].billing_date__c;
    filters.endDate = origin[0].billing_date__c;
    filters.serviceAreaCode = contract.supply_point_identification_no__c;

    // 明細(電気)を取得する
    List<Detail_E__c> billings = ElectricalBillingListContoller.getBillings(filters);

    System.assertEquals(
      1,
      billings.size(),
      '取得レコードが絞り込まれていること'
    );
  }

  @isTest
  static void getBillingsError() {
    // 明細(電気)を生成する
    List<Detail_E__c> origin = ElectricalDetailTestDataFactory.create(2);

    Exception error;
    try {
      // 明細(電気)を取得する
      List<Detail_E__c> billings = ElectricalBillingListContoller.getBillings(null);
    } catch (Exception e) {
      error = e;
    }

    System.assert(
      error instanceof IllegalArgumentException,
      '不正な引数が指定エラー発生確認'
    );
  }
}