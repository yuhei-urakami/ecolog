@isTest
private class GmoLinkPlusCommonParameterTest {
  @isTest
  static void toExteralParams() {
    GmoLinkPlusCommonParameter param = new GmoLinkPlusCommonParameter('sms');
    param.trans.orderId = 'SMS-00';
    param.trans.amount = 1;

    Map<String, Object> exteral = param.toExteralParams();

    System.assert(
      exteral.get('configid') != null,
      '設定IDが設定されていること'
    );
    System.assert(
      ((Map<String, Object>) exteral.get('transaction')).get('OrderID') != null,
      'オーダーIDが設定されていること'
    );
    System.assert(
      ((Map<String, Object>) exteral.get('transaction')).get('Amount') != null,
      '利用金額が設定されていること'
    );
  }
}