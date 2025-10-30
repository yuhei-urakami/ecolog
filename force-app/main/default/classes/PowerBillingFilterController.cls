public with sharing class PowerBillingFilterController {
  /**
   * 動力契約を取得する
   */
  @AuraEnabled
  public static Power_Contract__c getPowerContract(Id contractId) {
    return PowerContractsService.getPowerContract(contractId);
  }
}