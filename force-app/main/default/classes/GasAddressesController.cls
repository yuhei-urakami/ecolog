public with sharing class GasAddressesController {
  @AuraEnabled
  public static List<AggregateResult> getGasContracts(Id contractorId) {
    return [
      SELECT
        supply_point_identification_no__c,
        MAX(use_place_address_connect__c) use_place_address_connect__c
      FROM Gas_Contract__c
      WHERE contractor_information__c = :contractorId
      GROUP BY supply_point_identification_no__c
    ];
  }
}