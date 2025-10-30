public with sharing class GmoLinkplusGetUrlSevice {
  /**
   * パラメータクラス
   */
  public class Parameter {
    // リンクタイプplus 共通パラメータ
    public GmoLinkPlusCommonParameter common = new GmoLinkPlusCommonParameter(
      'sms'
    );
    // ショップID
    private String shopId = System.Label.GMO_SHOP_ID;
    // ショップパスワード
    private String shopPass = System.Label.GMO_SHOP_PASS;
    // お客様名
    public String customerName;
    // SMS配信先携帯電話番号
    public String smsTelNo;

    /**
     * 外部パラメータに変換する
     */
    private Map<String, Object> toExteralParams() {
      Map<String, Object> params = common.toExteralParams();
      params.put(
        'geturlparam',
        new Map<String, Object>{
          'ShopID' => shopId,
          'ShopPass' => shopPass,
          'CustomerName' => customerName,
          'SMSTelno' => smsTelNo == null ? null : smsTelNo.replace('-', '') // ハイフンを外す
        }
      );
      return params;
    }
  }

  /**
   * レスポンスクラス
   */
  public class Response {
    // オーダーID
    public String orderId { get; private set; }
    // 決済URL
    public String linkUrl { get; private set; }
    // 処理実行日時（yyyyMMddHHmmss形式)
    public String processDate { get; private set; }
    // ワーニング情報
    public List<Warn> warnList { get; private set; }
    // ワーニングか判定
    public Boolean isWarn() {
      return warnList != null;
    }
    // 警告メッセージを取得する
    public String getWarningMessage() {
      if (warnList == null) {
        return null;
      }

      List<String> messages = new List<String>();
      for (Warn warn : warnList) {
        messages.add(warn.getMessege());
      }
      return String.join(messages, '\n');
    }
  }
  /**
   * ワーニング情報クラス
   */
  public class Warn {
    // ワーニングコード
    public String warnCode { get; private set; }
    // ワーニング詳細コード
    public String warnInfo { get; private set; }
    // メッセージを取得する
    public String getMessege() {
      return 'warnCode:' + warnCode + ',' + 'warnInfo:' + warnInfo;
    }
  }

  /**
   * 決済案内を送信する
   */
  public static Response send(Parameter parameter) {
    // コールアウトする
    HttpResponse result = callout(parameter);

    // レスポンスクラスに変換する
    Response response = (Response) JSON.deserialize(
      result.getBody(),
      Response.class
    );
    // 警告あり
    if (response.isWarn()) {
      throw new WarningException(response.getWarningMessage());
    }

    return response;
  }

  /**
   * コールアウトする
   */
  private static HttpResponse callout(Parameter parameter) {
    Http http = new Http();
    HttpRequest req = new HttpRequest();

    String reqBody = JSON.serialize(parameter.toExteralParams());

    req.setEndpoint(
      'https://p01.mul-pay.jp/payment/GetLinkplusUrlPayment.json'
    );
    req.setMethod('POST');
    req.setHeader('Content-Type', 'application/json');
    req.setBody(reqBody);

    HttpResponse res = http.send(req);

    // ステータスが200以外もしくはレスポンスがリスト型の場合
    if (
      res.getStatusCode() != 200 ||
      JSON.deserializeUntyped(res.getBody()) instanceof List<Object>
    ) {
      throw new ApiException(res.getBody());
    }
    return res;
  }

  /**
   * API例外エラークラス
   */
  public class ApiException extends Exception {
  }

  /**
   * Warning例外エラークラス
   */
  public class WarningException extends Exception {
  }
}