@isTest
private class ContactsServiceTest {
  @isTest
  static void getErrorLoginContact() {
    Boolean isError = false;
    try {
      ContactsService.getLoginContact();
    } catch (Exception e) {
      isError = true;
    }
    System.assert(isError);
  }
  @isTest
  static void getLoginContact() {
    User user = UserTestDataFactory.createMyPageUser();
    System.runAs(user) {
      Contact contact = ContactsService.getLoginContact();
      System.assertEquals(user.ContactId, contact.Id);
    }
  }
}