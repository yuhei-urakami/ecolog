public with sharing class ContactsSelector {
  /**
   * インスタンスを生成する
   */
  public static ContactsSelector newInstance() {
    return new ContactsSelector();
  }
  /**
   * 取引先責任者IDより取引先責任者情報を取得する
   */
  public Contact selectById(Id Id) {
    List<Contact> records = selectByIds(new Set<Id>{ Id });
    return records.isEmpty() ? null : records[0];
  }
  /**
   * 取引先責任者ID(複数)より取引先責任者リストを取得する
   */
  public List<Contact> selectByIds(Set<Id> ids) {
    return [
      SELECT Id, Name, Contractor_Information__c
      FROM Contact
      WHERE id = :ids
    ];
  }
}