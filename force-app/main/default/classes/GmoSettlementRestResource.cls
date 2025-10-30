@RestResource(urlMapping='/Settlement/*')
global with sharing class GmoSettlementRestResource {
  @HttpPost
  global static void doPost() {
    // ボディの文字列情報を取得する
    String reqString = RestContext.request.requestBody.toString();
    // レスポンスに変換する
    GmoSettlementRestService.Response response = (GmoSettlementRestService.Response) JSON.deserialize(
      reqString,
      GmoSettlementRestService.Response.class
    );
    // 連携データをインポートする
    GmoSettlementRestService.import(response);
  }
}