public with sharing class GasBillingListContoller {
  public class Filters {
    @AuraEnabled
    public String startDate { get; set; }
    @AuraEnabled
    public String endDate { get; set; }
    @AuraEnabled
    public String serviceAreaCode { get; set; }
  }

  @AuraEnabled(cacheable=true scope='global')
  public static List<Detail_G__c> getBillings(Filters filters) {
    String startDate, endDate, serviceAreaCode, whereClause = '';
    List<String> criteria = new List<String>();

    if (filters == null) {
      throw new IllegalArgumentException('パラメータが正しくありません');
    }
    // 開始年月
    startDate = filters?.startDate;
    // 終了年月
    endDate = filters?.endDate;
    // 供給地点特定番号
    serviceAreaCode = filters?.serviceAreaCode;

    criteria.add('billing_date__c >= :startDate');
    criteria.add('billing_date__c <= :endDate');
    criteria.add(
      'gas_contract_id__c IN (SELECT Id FROM Gas_Contract__c WHERE supply_point_identification_no__c = :serviceAreaCode)'
    );
    whereClause = 'WHERE ' + String.join(criteria, ' AND ');
    return Database.query(
      'SELECT Id, billing_date__c, billing_amount__c, charges_start_date__c, meter_reading_date__c, number_of_instructions_lt__c, number_of_instructions_tt__c, view_amount_to_use__c FROM Detail_G__c ' +
        whereClause +
        ' WITH SECURITY_ENFORCED' +
        ' ORDER BY billing_date__c DESC'
    );
  }
}