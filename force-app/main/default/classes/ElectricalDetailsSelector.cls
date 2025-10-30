public with sharing class ElectricalDetailsSelector {
  /**
   * インスタンスを生成する
   */
  public static ElectricalDetailsSelector newInstance() {
    return new ElectricalDetailsSelector();
  }
  /**
   * 電気契約ID(複数)より明細(電気)リストを取得する
   */
  public List<Detail_E__c> selectByElectricalContractIds(Set<Id> ids) {
    return [
      SELECT
        Id,
        Name,
        billing_date_view__c,
        billing_amount__c,
        view_amount_to_use__c,
        meter_reading_date__c,
        basic_charge__c,
        pay_fee__c,
        electric_1tier_charge__c,
        electric_2tier_charge__c,
        electric_3tier_charge__c,
        nation_electric_bill_reduct_measures__c,
        fuel_cost_adjust_amount__c,
        renewable_energy_genepromo_levy__c,
        procurement_adjust_cost__c,
        Usage_period__c,
        relative_rate__c
        
      FROM Detail_E__c
      WHERE denki_contract_id__c = :ids
      ORDER BY billing_date__c DESC
    ];
  }
}