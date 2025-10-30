@isTest
private class ContractorInfoControllerTest {
  @isTest
  public static void getContact() {
    User user = UserTestDataFactory.createMyPageUser();
    System.runAs(user) {
      Contact contact = ContractorInfoController.getContact();
      System.assertEquals(user.ContactId, contact.Id);
    }
  }
}