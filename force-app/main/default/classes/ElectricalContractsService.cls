public with sharing class ElectricalContractsService {
  /**
   * 電気契約を取得する
   */
  public static Electrical_Contract__c getElectricalContract(Id contractId) {
    // 電気契約を取得する
    return ElectricalContractsSelector.newInstance().selectById(contractId);
  }

  /**
   * 供給地点特定番号に一致する電気(明細)を取得する
   */
  public static List<Detail_E__c> getBillingsByAreaCode(
    String serviceAreaCode
  ) {
    List<Electrical_Contract__c> contacts = ElectricalContractsSelector.newInstance()
      .selectByServiceAreaCodes(new Set<String>{ serviceAreaCode });

    // 電気契約を取得する
    return ElectricalDetailsSelector.newInstance()
      .selectByElectricalContractIds(new Map<Id, Electrical_Contract__c>(contacts).keySet());
  }
}