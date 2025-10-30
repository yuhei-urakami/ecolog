@isTest
private class NotificationControllerTest {
  @isTest
  static void getNotifications() {
    NotificationTestDataFactory.create(10);
    List<notification__c> notifications = NotificationController.getNotifications(
      5
    );
    System.assertEquals(
      5,
      notifications.size(),
      '指定された件数取得されること'
    );
  }
}