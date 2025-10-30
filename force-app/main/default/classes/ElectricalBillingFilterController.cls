public with sharing class ElectricalBillingFilterController {
  /**
   * 電気契約を取得する
   */
  @AuraEnabled
  public static Electrical_Contract__c getElectricalContract(Id contractId) {
    return ElectricalContractsService.getElectricalContract(contractId);
  }
}