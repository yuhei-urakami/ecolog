@isTest
private class DatetimeUtilsTest {
  // 現時刻
  private static final Datetime CURRENT_TIME = Datetime.now();
  @isTest
  static void parse() {
    Datetime dt = DatetimeUtils.parse(CURRENT_TIME.format('yyyyMMddHHmmss'));
    System.assert(
      CURRENT_TIME.isSameDay(dt),
      '指定した時刻に変換されていること'
    );
  }

  @isTest
  static void parseForError() {
    Exception error;
    try {
      Datetime dt = DatetimeUtils.parse(CURRENT_TIME.format('yyyy'));
    } catch (Exception e) {
      error = e;
    }
    System.assert(error instanceof TypeException, 'エラー発生確認');
  }
}