public with sharing class ElectricalAddressesController {
  /**
   * でんき契約（TDC）の契約者コードが一致する供給地点特定番号、使用場所住所を返す
   */
  @AuraEnabled
  public static List<AggregateResult> getElectricalContracts(Id contractorId) {
    return [
      SELECT
        supply_point_identification_no__c,
        MAX(use_place_address_connect__c) use_place_address_connect__c
      FROM Electrical_Contract__c
      WHERE contractor_information__c = :contractorId
      GROUP BY supply_point_identification_no__c
    ];
  }
}