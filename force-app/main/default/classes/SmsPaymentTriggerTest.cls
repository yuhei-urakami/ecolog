@isTest
private class SmsPaymentTriggerTest {
  @isTest
  static void onAfterInsert() {
    Test.setMock(HttpCalloutMock.class, GmoLinkplusGetUrlMock.getSuccess());

    Test.startTest();
    List<Sms_Payment__c> newRecords = SmsPaymentTestDataFactory.create(1);
    Test.stopTest();

    List<Sms_Payment__c> payments = [
      SELECT send_date__c
      FROM Sms_Payment__c
      WHERE Id = :newRecords[0].id
    ];

    System.assertNotEquals(
      null,
      payments[0].send_date__c,
      '送信日が設定があること'
    );
  }

  @isTest
  static void onAfterUpdate() {
    Test.setMock(HttpCalloutMock.class, GmoLinkplusGetUrlMock.getSuccess());

    Test.startTest();
    List<Sms_Payment__c> newRecords = SmsPaymentTestDataFactory.create(1);
    newRecords[0].send_date__c = null;
    update newRecords;
    Test.stopTest();

    List<Sms_Payment__c> payments = [
      SELECT send_date__c
      FROM Sms_Payment__c
      WHERE Id = :newRecords[0].id
    ];

    System.assertNotEquals(
      null,
      payments[0].send_date__c,
      '更新時にはAPI連携されないこと'
    );
  }
}