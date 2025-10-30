public with sharing class SmsPaymentsSelector {
  /**
   * インスタンスを生成する
   */
  public static SmsPaymentsSelector newInstance() {
    return new SmsPaymentsSelector();
  }
  /**
   * SMS決済IDよりSMS決済を取得する
   */
  public Sms_Payment__c selectById(Id Id) {
    List<Sms_Payment__c> records = selectByIds(new Set<Id>{ Id });
    return records.isEmpty() ? null : records[0];
  }
  /**
   * SMS決済ID(複数)よりSMS決済リストを取得する
   */
  public List<Sms_Payment__c> selectByIds(Set<Id> ids) {
    return [
      SELECT
        Id,
        Name,
        contractor_information__r.contractor_name__c,
        billing_amount__c,
        destination_mobile_phone__c,
        deposit_result__c,
        deposit_amount__c,
        payment_processing_datetime__c,
        deposit_method__c,
        deposit_error_details__c
      FROM Sms_Payment__c
      WHERE id = :ids
    ];
  }
  /**
   * SMS決済番号よりSMS決済を取得する
   */
  public Sms_Payment__c selectByName(String name) {
    List<Sms_Payment__c> records = selectByNames(new Set<String>{ name });
    return records.isEmpty() ? null : records[0];
  }
  /**
   * SMS決済番号(複数)よりSMS決済リストを取得する
   */
  public List<Sms_Payment__c> selectByNames(Set<String> names) {
    return [
      SELECT Id, payment_processing_datetime__c
      FROM Sms_Payment__c
      WHERE Name = :names
    ];
  }
}