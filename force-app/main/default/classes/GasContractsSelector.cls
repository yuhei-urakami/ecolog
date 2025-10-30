public with sharing class GasContractsSelector {
  /**
   * インスタンスを生成する
   */
  public static GasContractsSelector newInstance() {
    return new GasContractsSelector();
  }
  /**
   * ガス契約IDよりガス契約情報を取得する
   */
  public Gas_Contract__c selectById(Id Id) {
    List<Gas_Contract__c> records = selectByIds(new Set<Id>{ Id });
    return records.isEmpty() ? null : records[0];
  }
  /**
   * ガス契約ID(複数)よりガス契約情報リストを取得する
   */
  public List<Gas_Contract__c> selectByIds(Set<Id> ids) {
    return [
      SELECT Id, contractor_information__c, supply_point_identification_no__c
      FROM Gas_Contract__c
      WHERE id = :ids
    ];
  }

  /**
   * 供給地点特定番号よりガス契約情報リストを取得する
   */
  public List<Gas_Contract__c> selectByServiceAreaCodes(Set<String> codes) {
    return [
      SELECT Id
      FROM Gas_Contract__c
      WHERE supply_point_identification_no__c = :codes
    ];
  }

  /**
   * ガス明細よりガス契約を取得する
   */
  public Gas_Contract__c selectByGasDetailId(Id detailId) {
    List<Gas_Contract__c> records = selectByGasDetailIds(new Set<Id>{ detailId });
    return records.isEmpty() ? null : records[0];
  }

  /**
   * ガス明細(複数)よりガス契約を取得する
   */
  public List<Gas_Contract__c> selectByGasDetailIds(Set<Id> detailIds) {
    return [
      SELECT
        Id,
        customer_no__c,
        contractor_name__c,
        supply_point_identification_no__c,
        plan_code__r.Name,
        contractor_information__c
      FROM Gas_Contract__c
      WHERE Id IN (SELECT gas_contract_id__c FROM Detail_G__c WHERE Id = :detailIds)
    ];
  }
}