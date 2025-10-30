public with sharing class PowerBillingDetailController {
  /**
   * 動力(明細)を取得する
   */
  @AuraEnabled
  public static Power_Contract__c getContract(Id recordId) {
    return PowerDetailsService.getContract(recordId);
  }

  /**
   * 動力(明細)リストを取得する
   */
  @AuraEnabled
  public static List<Detail_P__c> getBillings(String serviceAreaCode) {
    // 供給地点特定番号に一致する動力(明細)を取得する
    return PowerContractsService.getBillingsByAreaCode(serviceAreaCode);
  }
}