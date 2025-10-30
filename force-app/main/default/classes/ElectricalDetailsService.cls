public with sharing class ElectricalDetailsService {
  /**
   * 電気契約を取得する
   */
  public static Electrical_Contract__c getContract(Id recordId) {
    // 電気契約を取得する
    return ElectricalContractsSelector.newInstance().selectByElectricalDetailId(recordId);
  }
}