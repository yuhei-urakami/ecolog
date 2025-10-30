public with sharing class GasContractsService {
  /**
   * ガス契約を取得する
   */
  public static Gas_Contract__c getGasContract(Id contractId) {
    // ガス契約を取得する
    return GasContractsSelector.newInstance().selectById(contractId);
  }

  /**
   * 供給地点特定番号に一致するガス(明細)を取得する
   */
  public static List<Detail_G__c> getBillingsByAreaCode(
    String serviceAreaCode
  ) {
    List<Gas_Contract__c> contacts = GasContractsSelector.newInstance()
      .selectByServiceAreaCodes(new Set<String>{ serviceAreaCode });

    // ガス契約を取得する
    return GasDetailsSelector.newInstance()
      .selectByGasContractIds(new Map<Id, Gas_Contract__c>(contacts).keySet());
  }
}