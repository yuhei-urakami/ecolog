public with sharing class DetailController {
  @AuraEnabled(cacheable=true scope='global')
  public static List<Detail__c> getBillings() {
    List<String> criteria = new List<String>();

    return Database.query(
      'SELECT Id, billing_date__c, billing_amount__c, billing_method__c, Payment_day__c, deposit_amount__c, payment_method__c, Breakdown_details__c FROM Detail__c ' +
        ' WITH SECURITY_ENFORCED' +
        ' ORDER BY billing_date__c DESC'
    );
  }

}