/**
 * 【GMO】リンクタイプplus 共通パラメータクラス
 */
public with sharing class GmoLinkPlusCommonParameter {
  // 設定ID
  private String configId;
  // 取引共通項目
  public Trans trans = new Trans();

  /**
   * 外部パラメータに変換する
   */
  public Map<String, Object> toExteralParams() {
    Map<String, Object> params = new Map<String, Object>();
    params.put('configid', configId);
    params.put('transaction', trans.toExteralParams());
    return params;
  }
  /**
   * コンストラクタ
   */
  public GmoLinkPlusCommonParameter(String value) {
    GmoLinkPlusParameterSetting__mdt setting = GmoLinkPlusParameterSetting__mdt.getInstance(
      value
    );
    if (setting != null) {
      configId = setting.config_id__c;
    }
  }

  /**
   * 取引共通項目クラス
   */
  public class Trans {
    // オーダーID
    public String orderId;
    // 利用金額
    public Decimal amount;

    /**
     * 外部パラメータに変換する
     */
    private Map<String, Object> toExteralParams() {
      Map<String, Object> params = new Map<String, Object>();
      params.put('OrderID', orderId);
      params.put('Amount', amount);
      return params;
    }
  }
}