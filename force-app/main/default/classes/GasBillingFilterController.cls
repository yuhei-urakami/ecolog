public with sharing class GasBillingFilterController {
  @AuraEnabled
  public static Gas_Contract__c getGasContract(Id contractId) {
    return GasContractsService.getGasContract(contractId);
  }
}