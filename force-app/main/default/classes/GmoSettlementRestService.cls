public with sharing class GmoSettlementRestService {
  public class Response {
    // オーダーID
    public String orderID;
    // 現状態
    public String status;
    // 利用金額
    public String amount;
    // 処理日時
    public String tranDate;
    // エラーコード
    public String errCode;
    // エラー詳細コード
    public String errInfo;
    // 決済方法
    public String payType;
    // 処理日時
    public Datetime processingDate {
      get {
        return DatetimeUtils.parse(tranDate);
      }
    }
    /**
     * SMS決済に連携データを適用する
     */
    public void applyValues(Sms_Payment__c sms) {
      // 入金方法
      sms.deposit_method__c = payType;
      // 入金結果
      sms.deposit_result__c = status;
      // 入金金額
      if (amount != null) {
        sms.deposit_amount__c = Decimal.valueOf(amount);
      }
      // 入金処理日時
      sms.payment_processing_datetime__c = processingDate;
      // エラー内容
      if (String.isNotBlank(errCode) && String.isNotBlank(errInfo)) {
        sms.deposit_error_details__c =
          'errCode:' +
          errCode +
          '\n' +
          'errInfo:' +
          errInfo;
      }
    }
  }

  /**
   * GMOペイメントからの連携データをSalesforceに取り込む
   */
  public static void import(Response response) {
    Sms_Payment__c sms = SmsPaymentsSelector.newInstance()
      .selectByName(response.orderID);
    // 対象データがない場合
    if (sms == null) {
      return;
    }
    // 入金処理日がすでに設定されており、処理日が入金処理日以前の場合
    if (
      sms.payment_processing_datetime__c != null &&
      sms.payment_processing_datetime__c >= response.processingDate
    ) {
      return;
    }
    response.applyValues(sms);
    update sms;
  }
}