public with sharing class PowerContractsSelector {
  /**
   * インスタンスを生成する
   */
  public static PowerContractsSelector newInstance() {
    return new PowerContractsSelector();
  }
  /**
   * 動力契約IDより動力契約情報を取得する
   */
  public Power_Contract__c selectById(Id Id) {
    List<Power_Contract__c> records = selectByIds(new Set<Id>{ Id });
    return records.isEmpty() ? null : records[0];
  }
  /**
   * 動力契約ID(複数)より動力契約情報リストを取得する
   */
  public List<Power_Contract__c> selectByIds(Set<Id> ids) {
    return [
      SELECT Id, contractor_information__c, supply_point_identification_no__c
      FROM Power_Contract__c
      WHERE id = :ids
    ];
  }

  /**
   * 供給地点特定番号より動力契約情報リストを取得する
   */
  public List<Power_Contract__c> selectByServiceAreaCodes(Set<String> codes) {
    return [
      SELECT Id
      FROM Power_Contract__c
      WHERE supply_point_identification_no__c = :codes
    ];
  }

  /**
   * 動力明細より動力契約を取得する
   */
  public Power_Contract__c selectByPowerDetailId(Id detailId) {
    List<Power_Contract__c> records = selectByPowerDetailIds(new Set<Id>{ detailId });
    return records.isEmpty() ? null : records[0];
  }

  /**
   * 動力明細(複数)より動力契約を取得する
   */
  public List<Power_Contract__c> selectByPowerDetailIds(Set<Id> detailIds) {
    return [
      SELECT
        Id,
        customer_no__c,
        contractor_name__c,
        supply_point_identification_no__c,
        plan_code__r.Name,
        plan_code__c,
        contractor_information__c
      FROM Power_Contract__c
          WHERE Id IN (SELECT power_contract_id__c FROM Detail_P__c WHERE Id = :detailIds)
    ];
  }
}