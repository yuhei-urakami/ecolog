public with sharing class PowerDetailsSelector {
  /**
   * インスタンスを生成する
   */
  public static PowerDetailsSelector newInstance() {
    return new PowerDetailsSelector();
  }
  /**
   * 動力契約ID(複数)より明細(動力)リストを取得する
   */
  public List<Detail_P__c> selectByPowerContractIds(Set<Id> ids) {
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
        electricity_charge_other_seasons__c,
        nation_electric_bill_reduct_measures__c,
        fuel_cost_adjust_amount__c,
        renewable_energy_genepromo_levy__c,
        Usage_period__c,
        relative_rate__c,
        number_of_instructions_lt__c,
        number_of_instructions_tt__c,
        plan_code__c,
        Date_of_next_examination__c
        
      FROM Detail_P__c
      WHERE power_contract_id__c = :ids
      ORDER BY billing_date__c DESC
    ];
  }
}