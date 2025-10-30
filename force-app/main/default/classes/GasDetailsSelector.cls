public with sharing class GasDetailsSelector {
  /**
   * インスタンスを生成する
   */
  public static GasDetailsSelector newInstance() {
    return new GasDetailsSelector();
  }
  /**
   * ガス契約ID(複数)より明細(ガス)リストを取得する
   */
  public List<Detail_G__c> selectByGasContractIds(Set<Id> ids) {
    return [
      SELECT
        Id,
        Name,
        billing_date_view__c,
        billing_amount__c,
        view_amount_to_use__c,
        meter_reading_date__c,
        number_of_instructions_lt__c,
        number_of_instructions_tt__c,
        basic_charge__c,
        pay_fee__c,
        Date_of_next_examination__c,
        relative_rate__c
      FROM Detail_G__c
      WHERE gas_contract_id__c = :ids
      ORDER BY billing_date__c DESC
    ];
  }
}