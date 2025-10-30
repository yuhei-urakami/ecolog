public with sharing class ContactsService {
  /**
   * ログイン取引先責任者を取得する
   */
  public static Contact getLoginContact() {
    // ログインユーザを取得
    User loginUser = UsersSelector.newInstance().selectByLoginUser();
    
    if (loginUser == null || loginUser.ContactId == null) {
      throw new HandledException('ログインユーザ情報の取得失敗しました');
    }
    // ログインユーザに対応する取引先責任者を取得する
    return ContactsSelector.newInstance().selectById(loginUser.ContactId);
  }
}