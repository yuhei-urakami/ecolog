public with sharing class SmsPaymentsTriggerHandler {
  /*
   * トリガーの挿入後処理
   */
  public void onAfterInsert(List<Sms_Payment__c> newRecords) {
    // 決済URL送信
    sendPaymentUrl(newRecords);
  }
  /*
   * 決済URL送信
   */
  private void sendPaymentUrl(List<Sms_Payment__c> newRecords) {
    // マップに変換する
    Map<Id, Sms_Payment__c> newMap = new Map<Id, Sms_Payment__c>(newRecords);

    Set<Id> ids = new Set<Id>();
    for (Id id : newMap.keySet()) {
      ids.add(id);
      // ガバナ制限を考慮して、10件ずつコールアウトする
      if (ids.size() >= 10) {
        SmsPaymentsService.sendPaymentUrl(ids);
        ids.clear();
      }
    }
    if (!ids.isEmpty()) {
      SmsPaymentsService.sendPaymentUrl(ids);
    }
  }
}