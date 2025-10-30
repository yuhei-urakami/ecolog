public class SmsPaymentTestDataFactory {
  public static List<Sms_Payment__c> create(Integer num) {
    List<Contractor_Information__c> parents = ContractorInformationTestDataFactory.create(
      1
    );
    List<Sms_Payment__c> payments = new List<Sms_Payment__c>();
    for (Integer i = 0; i < num; i++) {
      Sms_Payment__c payment = new Sms_Payment__c();
      payment.billing_amount__c = i;
      payment.contractor_information__c = parents[0].id;
      payment.destination_mobile_phone__c = '000-1111-1111';
      payments.add(payment);
    }
    insert payments;
    return payments;
  }
}