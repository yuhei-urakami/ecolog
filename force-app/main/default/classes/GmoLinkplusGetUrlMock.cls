@isTest
public class GmoLinkplusGetUrlMock {
  // 決済URL
  public static final STring LINK_URL = 'https://link.mul-pay.jp/v2/plus/test';

  /**
   * 正常時
   */
  public static HttpCalloutMock getSuccess() {
    return new Success();
  }
  /**
   * 警告時
   */
  public static HttpCalloutMock getWarning() {
    return new Warning();
  }
  /**
   * エラー時(ステータスコード:200)
   */
  public static HttpCalloutMock getError() {
    return new Error();
  }
  /**
   * エラー時(ステータスコード:200以外)
   */
  public static HttpCalloutMock getResponseError() {
    return new ResponseError();
  }

  /**
   * 正常時のレスポンスを返却するモッククラス
   */
  private class Success implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest req) {
      HttpResponse res = new HttpResponse();
      res.setHeader('Content-Type', 'application/json');
      res.setBody(
        '{"OrderID": "sample-123456789","LinkUrl": "' +
          LINK_URL +
          '","ProcessDate": "20200727142656"}'
      );
      res.setStatusCode(200);
      return res;
    }
  }
  /**
   * 警告時のレスポンスを返却するモッククラス
   */
  private class Warning implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest req) {
      HttpResponse res = new HttpResponse();
      res.setHeader('Content-Type', 'application/json');
      res.setBody(
        '{"OrderID": "sample-123456789","LinkUrl": "' +
          LINK_URL +
          '","ProcessDate": "20200727142656","WarnList": [{"warnCode": "EZ4","warnInfo": "EZ4135014"}]}'
      );
      res.setStatusCode(200);
      return res;
    }
  }
  /**
   * エラー時(ステータスコード:200)のレスポンスを返却するモッククラス
   */
  private class Error implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest req) {
      HttpResponse res = new HttpResponse();
      res.setHeader('Content-Type', 'application/json');
      res.setBody(
        '[{"errCode": "E90","errInfo": "E90010001"},{"errCode": "E90","errInfo": "E92000001"},{"errCode": "E90","errInfo": "E92000002"}]'
      );
      res.setStatusCode(200);
      return res;
    }
  }
  /**
   * レスポンスエラー時(ステータスコード:200以外)のレスポンスを返却するモッククラス
   */
  private class ResponseError implements HttpCalloutMock {
    public HTTPResponse respond(HTTPRequest req) {
      HttpResponse res = new HttpResponse();
      res.setHeader('Content-Type', 'application/json');
      res.setBody(
        '[{"errCode": "EZ1","errInfo": "EZ1004005"},{"errCode": "EZ1","errInfo": "EZ1004001"},{"errCode": "EZ1","errInfo": "EZ1005005"}]'
      );
      res.setStatusCode(400);
      return res;
    }
  }
}