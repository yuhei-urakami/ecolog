trigger SmsPaymentTrigger on Sms_Payment__c(after insert) {
  new SmsPaymentsTriggerHandler().onAfterInsert(Trigger.new);
}