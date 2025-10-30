@isTest
public class ContactTestDataFactory {
  public static List<Contact> create(Integer num) {
    // 取引先
    List<Account> accs = AccountTestDataFactory.create(num);
    // 契約者情報
    List<Contractor_Information__c> contractorInfos = ContractorInformationTestDataFactory.create(
      num
    );
    List<Contact> contacts = new List<Contact>();
    for (Integer i = 0; i < num; i++) {
      Contact contact = new Contact(
        LastName = 'LastName' + i,
        FirstName = 'FirstName' + i,
        AccountId = accs[i].Id,
        Contractor_Information__c = contractorInfos[i].Id
      );
      contacts.add(contact);
    }
    insert contacts;
    return contacts;
  }
}