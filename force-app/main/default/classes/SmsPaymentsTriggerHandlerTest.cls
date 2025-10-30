@isTest
private class SmsPaymentsTriggerHandlerTest {
  @isTest
  static void sendPaymentUrl() {
    Test.setMock(HttpCalloutMock.class, GmoLinkplusGetUrlMock.getSuccess());

    List<Sms_Payment__c> newRecords = SmsPaymentTestDataFactory.create(105);

    Test.startTest();
    new SmsPaymentsTriggerHandler().onAfterInsert(newRecords);
    Test.stopTest();

    System.assertEquals(
      11,
      Limits.getFutureCalls(),
      'コールアウト回数が11回であること'
    );
  }
}