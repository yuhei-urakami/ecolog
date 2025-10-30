@isTest
public class AccountTestDataFactory {
  public static List<Account> create(Integer num) {
    List<Account> accs = new List<Account>();
    for (Integer i = 0; i < num; i++) {
      Account acc = new Account(Name = 'Name' + i);
      accs.add(acc);
    }
    insert accs;
    return accs;
  }
}