@isTest
public class UsersSelectorTest {
  @isTest
  static void test_newInstance() {
    Object instance = UsersSelector.newInstance();
    System.assert(instance instanceof UsersSelector);
  }

  @isTest
  static void test_selectByLoginUser() {
    User source = UsersSelector.newInstance().selectByLoginUser();
    System.assertEquals(UserInfo.getUserId(), source.Id);
  }

  @isTest
  static void test_selectByIds() {
    List<User> origin = [SELECT Id FROM User];
    List<User> source = UsersSelector.newInstance()
      .selectByIds(new Map<Id, User>(origin).keySet());
    System.assertEquals(origin.size(), source.size());
  }
}