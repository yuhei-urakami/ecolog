public with sharing class PowerContractsService {
  /**
   * 動力契約を取得する
   */
  public static Power_Contract__c getPowerContract(Id contractId) {
    // 動力契約を取得する
    return PowerContractsSelector.newInstance().selectById(contractId);
  }

  /**
   * 供給地点特定番号に一致する動力(明細)を取得する
   */
  public static List<Detail_P__c> getBillingsByAreaCode(
    String serviceAreaCode
  ) {
    List<Power_Contract__c> contacts = PowerContractsSelector.newInstance()
      .selectByServiceAreaCodes(new Set<String>{ serviceAreaCode });

    // 動力契約を取得する
    return PowerDetailsSelector.newInstance()
      .selectByPowerContractIds(new Map<Id, Power_Contract__c>(contacts).keySet());
  }
}