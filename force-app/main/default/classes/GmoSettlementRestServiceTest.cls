@isTest
private class GmoSettlementRestServiceTest {
  // 現時刻
  private static final Datetime CURRENT_TIME = Datetime.now();
  @isTest
  static void import() {
    Sms_Payment__c data = SmsPaymentTestDataFactory.create(1)[0];
    // データを取得する
    Sms_Payment__c sms = SmsPaymentsSelector.newInstance().selectById(data.Id);
    GmoSettlementRestService.Response response = new GmoSettlementRestService.Response();
    response.orderID = sms.Name;
    response.status = 'CAPTURE';
    response.amount = '300';
    response.tranDate = CURRENT_TIME.format('yyyyMMddHHmmss');
    response.payType = '0';
    response.errCode = 'E1|E1';
    response.errInfo = 'EXXXXXXXX|EYYYYYYY';
    // インポートする
    GmoSettlementRestService.import(response);
    // データを再取得する
    sms = SmsPaymentsSelector.newInstance().selectById(data.Id);
    System.assertEquals(
      response.status,
      sms.deposit_result__c,
      '入金結果が設定されていること'
    );
    System.assertEquals(
      Decimal.valueOf(response.amount),
      sms.deposit_amount__c,
      '入金金額が設定されていること'
    );
    System.assertEquals(
      CURRENT_TIME,
      sms.payment_processing_datetime__c,
      '入金処理日時が設定されていること'
    );
    System.assertEquals(
      response.payType,
      sms.deposit_method__c,
      '入金方法が設定されていること'
    );
    System.assert(
      String.isNotBlank(sms.deposit_error_details__c),
      'エラー内容が設定されていること'
    );
  }
  @isTest
  static void importDataMissing() {
    Sms_Payment__c data = SmsPaymentTestDataFactory.create(1)[0];
    // データを取得する
    Sms_Payment__c sms = SmsPaymentsSelector.newInstance().selectById(data.Id);
    GmoSettlementRestService.Response response = new GmoSettlementRestService.Response();
    response.orderID = 'TEST';
    response.amount = '300';
    // インポートする
    GmoSettlementRestService.import(response);
    // データを再取得する
    sms = SmsPaymentsSelector.newInstance().selectById(data.Id);
    System.assertEquals(
      null,
      sms.deposit_amount__c,
      '入金金額が設定されていないこと'
    );
  }

  @isTest
  static void importOutsideProcessingTime() {
    Sms_Payment__c data = SmsPaymentTestDataFactory.create(1)[0];
    // データを取得する
    Sms_Payment__c sms = SmsPaymentsSelector.newInstance().selectById(data.Id);
    GmoSettlementRestService.Response response = new GmoSettlementRestService.Response();
    response.orderID = sms.Name;
    response.tranDate = CURRENT_TIME.format('yyyyMMddHHmmss');
    // インポートする
    GmoSettlementRestService.import(response);
    // 1秒前に設定する
    response.tranDate = CURRENT_TIME.addSeconds(-1).format('yyyyMMddHHmmss');
    // インポートする
    GmoSettlementRestService.import(response);
    // データを再取得する
    sms = SmsPaymentsSelector.newInstance().selectById(data.Id);
    System.assertEquals(
      CURRENT_TIME,
      sms.payment_processing_datetime__c,
      '入金処理日時が前のままであること'
    );
  }
}