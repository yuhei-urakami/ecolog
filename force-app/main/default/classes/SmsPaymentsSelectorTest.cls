@isTest
private class SmsPaymentsSelectorTest {
  @isTest
  static void newInstance() {
    Object instance = SmsPaymentsSelector.newInstance();
    System.assert(instance instanceof SmsPaymentsSelector);
  }
  @isTest
  static void selectById() {
    List<Sms_Payment__c> origin = SmsPaymentTestDataFactory.create(2);
    Sms_Payment__c source = SmsPaymentsSelector.newInstance()
      .selectById(origin[0].Id);
    System.assertEquals(origin[0].Id, source.Id);
  }
  @isTest
  static void selectByIds() {
    List<Sms_Payment__c> origin = SmsPaymentTestDataFactory.create(2);
    List<Sms_Payment__c> source = SmsPaymentsSelector.newInstance()
      .selectByIds(new Map<Id, Sms_Payment__c>(origin).keySet());
    System.assertEquals(origin.size(), source.size());
  }

  @isTest
  static void selectByName() {
    // 生成したレコード
    List<Sms_Payment__c> records = SmsPaymentTestDataFactory.create(2);
    // Name項目を取得するため、SELECTする
    List<Sms_Payment__c> origin = SmsPaymentsSelector.newInstance()
      .selectByIds(new Map<Id, Sms_Payment__c>(records).keySet());
    Sms_Payment__c source = SmsPaymentsSelector.newInstance()
      .selectByName(origin[0].Name);
    System.assertEquals(origin[0].Id, source.Id);
  }

  @isTest
  static void selectByNames() {
    // 生成したレコード
    List<Sms_Payment__c> records = SmsPaymentTestDataFactory.create(2);
    // Name項目を取得するため、SELECTする
    List<Sms_Payment__c> origin = SmsPaymentsSelector.newInstance()
      .selectByIds(new Map<Id, Sms_Payment__c>(records).keySet());
    List<Sms_Payment__c> source = SmsPaymentsSelector.newInstance()
      .selectByNames(new Set<String>{ origin[0].Name, origin[1].Name });
    System.assertEquals(origin.size(), source.size());
  }
}