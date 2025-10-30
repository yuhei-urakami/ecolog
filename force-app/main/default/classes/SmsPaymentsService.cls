public with sharing class SmsPaymentsService {
  /*
   * 決済URL送信
   */
  @future(callout=true)
  public static void sendPaymentUrl(Set<Id> Ids) {
    List<Sms_Payment__c> payments = new List<Sms_Payment__c>();
    for (
      Sms_Payment__c record : SmsPaymentsSelector.newInstance().selectByIds(Ids)
    ) {
      GmoLinkplusGetUrlSevice.Parameter parameter = new GmoLinkplusGetUrlSevice.Parameter();
      parameter.common.trans.orderId = record.Name;
      parameter.common.trans.amount = record.billing_amount__c;
      parameter.customerName = record.contractor_information__r.contractor_name__c;
      parameter.smsTelNo = record.destination_mobile_phone__c;

      try {
        GmoLinkplusGetUrlSevice.Response response = GmoLinkplusGetUrlSevice.send(
          parameter
        );
        // 送信日
        record.send_date__c = Date.today();
        // ステータス
        record.sending_result__c = '送信済';
        // 決済URL
        record.payment_url__c = response.linkUrl;
      } catch (Exception e) {
        // ステータス
        record.sending_result__c = '送信エラー';
        // エラー内容
        record.payment_url__c = e.getMessage();
      }
      payments.add(record);
    }
    // 更新する
    update payments;
  }
}