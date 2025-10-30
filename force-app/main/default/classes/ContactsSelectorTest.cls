@isTest
private class ContactsSelectorTest {
  @isTest
  static void newInstance() {
    Object instance = ContactsSelector.newInstance();
    System.assert(instance instanceof ContactsSelector);
  }

  @isTest
  static void selectById() {
    List<Contact> origin = ContactTestDataFactory.create(2);
    Contact source = ContactsSelector.newInstance().selectById(origin[0].Id);
    System.assertEquals(origin[0].Id, source.Id);
  }

  @isTest
  static void selectByIds() {
    List<Contact> origin = ContactTestDataFactory.create(2);
    List<Contact> source = ContactsSelector.newInstance()
      .selectByIds(new Map<Id, Contact>(origin).keySet());
    System.assertEquals(origin.size(), source.size());
  }
}