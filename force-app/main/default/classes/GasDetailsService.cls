public with sharing class GasDetailsService {
  /**
   * ガス契約を取得する
   */
  public static Gas_Contract__c getContract(Id recordId) {
    // ガス契約を取得する
    return GasContractsSelector.newInstance().selectByGasDetailId(recordId);
  }
}