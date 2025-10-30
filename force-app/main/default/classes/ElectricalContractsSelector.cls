public with sharing class ElectricalContractsSelector {
  /**
   * インスタンスを生成する
   */
  public static ElectricalContractsSelector newInstance() {
    return new ElectricalContractsSelector();
  }
  /**
   * 電気契約IDより電気契約情報を取得する
   */
  public Electrical_Contract__c selectById(Id Id) {
    List<Electrical_Contract__c> records = selectByIds(new Set<Id>{ Id });
    return records.isEmpty() ? null : records[0];
  }
  /**
   * 電気契約ID(複数)より電気契約情報リストを取得する
   */
  public List<Electrical_Contract__c> selectByIds(Set<Id> ids) {
    return [
      SELECT Id, contractor_information__c, supply_point_identification_no__c
      FROM Electrical_Contract__c
      WHERE id = :ids
    ];
  }

  /**
   * 供給地点特定番号より電気契約情報リストを取得する
   */
  public List<Electrical_Contract__c> selectByServiceAreaCodes(Set<String> codes) {
    return [
      SELECT Id
      FROM Electrical_Contract__c
      WHERE supply_point_identification_no__c = :codes
    ];
  }

  /**
   * 電気明細より電気契約を取得する
   */
  public Electrical_Contract__c selectByElectricalDetailId(Id detailId) {
    List<Electrical_Contract__c> records = selectByElectricalDetailIds(new Set<Id>{ detailId });
    return records.isEmpty() ? null : records[0];
  }

  /**
   * 電気明細(複数)より電気契約を取得する
   */
  public List<Electrical_Contract__c> selectByElectricalDetailIds(Set<Id> detailIds) {
    return [
      SELECT
        Id,
        customer_no__c,
        contractor_name__c,
        supply_point_identification_no__c,
        plan_code__r.Name,
        contractor_information__c
      FROM Electrical_Contract__c
          WHERE Id IN (SELECT denki_contract_id__c FROM Detail_E__c WHERE Id = :detailIds )
    ];
  }
}