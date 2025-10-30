public with sharing class ElectricalBillingDetailController {
  /**
   * 電気(明細)を取得する
   */
  @AuraEnabled
  public static Electrical_Contract__c getContract(Id recordId) {
    return ElectricalDetailsService.getContract(recordId);
  }

  /**
   * 電気(明細)リストを取得する
   */
  @AuraEnabled
  public static List<Detail_E__c> getBillings(String serviceAreaCode) {
    // 供給地点特定番号に一致する電気(明細)を取得する
    return ElectricalContractsService.getBillingsByAreaCode(serviceAreaCode);
  }
}