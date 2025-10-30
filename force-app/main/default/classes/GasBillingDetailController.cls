public with sharing class GasBillingDetailController {
  /**
   * ガス(明細)を取得する
   */
  @AuraEnabled
  public static Gas_Contract__c getContract(Id recordId) {
    return GasDetailsService.getContract(recordId);
  }

  /**
   * ガス(明細)リストを取得する
   */
  @AuraEnabled
  public static List<Detail_G__c> getBillings(String serviceAreaCode) {
    // 供給地点特定番号に一致するガス(明細)を取得する
    return GasContractsService.getBillingsByAreaCode(serviceAreaCode);
  }
}