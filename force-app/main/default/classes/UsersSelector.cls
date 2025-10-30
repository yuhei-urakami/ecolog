public with sharing class UsersSelector {
  /**
   * インスタンスを生成する
   */
  public static UsersSelector newInstance() {
    return new UsersSelector();
  }
  /**
   * ログインユーザ情報を取得する
   */
  public User selectByLoginUser() {
    List<User> records = selectByIds(new Set<Id>{ UserInfo.getUserId() });
    return records.isEmpty() ? null : records[0];
  }
  /**
   * ユーザID(複数)よりユーザリストを取得する
   */
  public List<User> selectByIds(Set<Id> ids) {
    return [SELECT Id, Name, ContactId FROM User WHERE id = :ids];
  }
}