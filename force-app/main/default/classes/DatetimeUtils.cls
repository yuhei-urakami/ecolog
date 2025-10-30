public with sharing class DatetimeUtils {
  /**
   * 日時に変換する
   */
  public static Datetime parse(String value) {
    //yyyyMMddHHmmss形式
    Pattern p = Pattern.compile(
      '^([0-9]{4})(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|3[01])([01][0-9]|2[0-3])([0-5][0-9])([0-5][0-9])$'
    );
    Matcher m = p.matcher(value);
    if (!m.find()) {
      throw new TypeException('無効な日付/時刻：' + value);
    }
    return Datetime.newInstance(
      Integer.valueOf(m.group(1)),
      Integer.valueOf(m.group(2)),
      Integer.valueOf(m.group(3)),
      Integer.valueOf(m.group(4)),
      Integer.valueOf(m.group(5)),
      Integer.valueOf(m.group(6))
    );
  }
}