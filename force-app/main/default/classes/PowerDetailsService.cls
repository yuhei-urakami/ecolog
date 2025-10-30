public with sharing class PowerDetailsService {
  /**
   * 動力契約を取得する
   */
  public static Power_Contract__c getContract(Id recordId) {
    // 動力契約を取得する
    return PowerContractsSelector.newInstance().selectByPowerDetailId(recordId);
  }
}