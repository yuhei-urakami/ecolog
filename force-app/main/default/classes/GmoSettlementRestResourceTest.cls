@isTest
private class GmoSettlementRestResourceTest {
  // 現時刻
  private static final Datetime CURRENT_TIME = Datetime.now();
  @isTest
  static void doPost() {
    Sms_Payment__c data = SmsPaymentTestDataFactory.create(1)[0];
    // データを取得する
    Sms_Payment__c sms = SmsPaymentsSelector.newInstance().selectById(data.Id);
    RestRequest request = new RestRequest();
    request.httpMethod = 'POST';
    RestContext.request = request;

    JSONGenerator gen = JSON.createGenerator(false);
    gen.writeStartObject();
    gen.writeStringField('ShopID', 'ショップテストID');
    gen.writeStringField('ShopPass', '**********');
    gen.writeStringField('AccessID', 'アクセステストID');
    gen.writeStringField('test', '**********');
    gen.writeStringField('OrderID', sms.Name);
    gen.writeStringField('Status', 'CAPTURE');
    gen.writeStringField('Amount', '500');
    gen.writeStringField('TranDate', CURRENT_TIME.format('yyyyMMddHHmmss'));
    gen.writeNullField('ErrCode');
    gen.writeNullField('ErrInfo');
    gen.writeStringField('PayType', '0');
    gen.writeEndObject();
    RestContext.request.requestBody = Blob.valueOf(gen.getAsString());
    // 対象となるメソッドの処理を実行する
    GmoSettlementRestResource.doPost();
    // データを再取得する
    sms = SmsPaymentsSelector.newInstance().selectById(data.Id);
    System.assertEquals(
      'CAPTURE',
      sms.deposit_result__c,
      '入金結果が設定されていること'
    );
  }
}