@isTest
public class UserTestDataFactory {
  public static User createMyPageUser() {
    List<Contact> contacts = ContactTestDataFactory.create(1);
    Profile p = [
      SELECT Id
      FROM Profile
      WHERE Name = 'エコログ：マイページ'
      LIMIT 1
    ];

    user user = new User(
      UserName = 'test_' + math.random() + '@test.com',
      FirstName = 'FirstName',
      LastName = 'LastName',
      Alias = 'test',
      email = 'test' + math.random() + '@test.com',
      CommunityNickName = string.valueOf(math.random()).substring(0, 6),
      TimeZoneSidKey = 'Asia/Tokyo',
      LocaleSidKey = 'ja_JP',
      EmailEncodingKey = 'ISO-2022-JP',
      LanguageLocaleKey = 'ja',
      ProfileID = p.id,
      ContactID = contacts[0].Id
    );
    insert user;
    return user;
  }
}