public with sharing class PowerAddressesController {
  /**
   * 動力契約（TPC）の契約者コードが一致する供給地点特定番号、使用場所住所を返す
   */
  @AuraEnabled
  public static List<AggregateResult> getPowerContracts(Id contractorId) {
    return [
      SELECT
        supply_point_identification_no__c,
        MAX(use_place_address_connect__c) use_place_address_connect__c
      FROM Power_Contract__c
      WHERE contractor_information__c = :contractorId
      GROUP BY supply_point_identification_no__c
    ];
  }
}