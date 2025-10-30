@isTest
private class SmsPaymentsServiceTest {
  @isTest
  static void sendPaymentUrl() {
    Test.setMock(HttpCalloutMock.class, GmoLinkplusGetUrlMock.getSuccess());

    Set<Id> paymentIds = new Map<Id, Sms_Payment__c>(
        SmsPaymentTestDataFactory.create(1)
      )
      .keySet();
    Test.startTest();
    SmsPaymentsService.sendPaymentUrl(paymentIds);
    Test.stopTest();

    List<Sms_Payment__c> payments = [
      SELECT send_date__c, sending_result__c, payment_url__c
      FROM Sms_Payment__c
      WHERE Id = :paymentIds
    ];

    System.assertEquals(
      Date.today(),
      payments[0].send_date__c,
      '送信日が本日の日付であること'
    );
    System.assertEquals(
      '送信済',
      payments[0].sending_result__c,
      '送信結果が送信済であること'
    );
    System.assertEquals(
      GmoLinkplusGetUrlMock.LINK_URL,
      payments[0].payment_url__c,
      '決済URLにURLが設定されていること'
    );
  }

  @isTest
  static void sendPaymentUrlForWaninrg() {
    Test.setMock(HttpCalloutMock.class, GmoLinkplusGetUrlMock.getWarning());

    Set<Id> paymentIds = new Map<Id, Sms_Payment__c>(
        SmsPaymentTestDataFactory.create(1)
      )
      .keySet();
    Test.startTest();
    SmsPaymentsService.sendPaymentUrl(paymentIds);
    Test.stopTest();

    List<Sms_Payment__c> payments = [
      SELECT send_date__c, sending_result__c, payment_url__c
      FROM Sms_Payment__c
      WHERE Id = :paymentIds
    ];

    System.assertEquals(
      null,
      payments[0].send_date__c,
      '送信日が未設定であること'
    );
    System.assertEquals(
      '送信エラー',
      payments[0].sending_result__c,
      '送信結果が送信エラーであること'
    );
    System.assertNotEquals(
      GmoLinkplusGetUrlMock.LINK_URL,
      payments[0].payment_url__c,
      '決済URLにURLが設定されていないこと'
    );
  }
  @isTest
  static void sendPaymentUrlForError() {
    Test.setMock(HttpCalloutMock.class, GmoLinkplusGetUrlMock.getError());

    Set<Id> paymentIds = new Map<Id, Sms_Payment__c>(
        SmsPaymentTestDataFactory.create(1)
      )
      .keySet();
    Test.startTest();
    SmsPaymentsService.sendPaymentUrl(paymentIds);
    Test.stopTest();

    List<Sms_Payment__c> payments = [
      SELECT send_date__c, sending_result__c, payment_url__c
      FROM Sms_Payment__c
      WHERE Id = :paymentIds
    ];

    System.assertEquals(
      null,
      payments[0].send_date__c,
      '送信日が未設定であること'
    );
    System.assertEquals(
      '送信エラー',
      payments[0].sending_result__c,
      '送信結果が送信エラーであること'
    );
    System.assertNotEquals(
      GmoLinkplusGetUrlMock.LINK_URL,
      payments[0].payment_url__c,
      '決済URLにURLが設定されていないこと'
    );
  }
}