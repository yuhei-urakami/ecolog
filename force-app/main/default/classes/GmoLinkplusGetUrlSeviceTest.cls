@isTest
private class GmoLinkplusGetUrlSeviceTest {
  @isTest
  static void callout() {
    Test.setMock(HttpCalloutMock.class, GmoLinkplusGetUrlMock.getSuccess());

    Test.startTest();
    GmoLinkplusGetUrlSevice.Response response = GmoLinkplusGetUrlSevice.send(
      new GmoLinkplusGetUrlSevice.Parameter()
    );
    Test.stopTest();

    System.assert(
      String.isNotBlank(response.orderId),
      'オーダーIDが設定されていること'
    );
    System.assert(
      String.isNotBlank(response.linkUrl),
      '決済URLが設定されていること'
    );
    System.assert(
      String.isNotBlank(response.processDate),
      '処理日が設定されてること'
    );
    System.assert(!response.isWarn(), '警告なし');
    System.assert(
      String.isBlank(response.getWarningMessage()),
      '警告メッセージなし'
    );
  }

  @isTest
  static void calloutWarning() {
    Test.setMock(HttpCalloutMock.class, GmoLinkplusGetUrlMock.getWarning());

    Exception error;
    Test.startTest();
    try {
      GmoLinkplusGetUrlSevice.Response response = GmoLinkplusGetUrlSevice.send(
        new GmoLinkplusGetUrlSevice.Parameter()
      );
    } catch (Exception e) {
      error = e;
    }
    Test.stopTest();
    System.assert(
      error instanceof GmoLinkplusGetUrlSevice.WarningException,
      'Warningエラー発生確認'
    );
  }
  @isTest
  static void calloutError() {
    Test.setMock(HttpCalloutMock.class, GmoLinkplusGetUrlMock.getError());

    Exception error;
    Test.startTest();
    try {
      GmoLinkplusGetUrlSevice.Response response = GmoLinkplusGetUrlSevice.send(
        new GmoLinkplusGetUrlSevice.Parameter()
      );
    } catch (Exception e) {
      error = e;
    }
    Test.stopTest();
    System.assert(
      error instanceof GmoLinkplusGetUrlSevice.ApiException,
      'APIエラー発生確認'
    );
  }

  @isTest
  static void calloutResponseError() {
    Test.setMock(
      HttpCalloutMock.class,
      GmoLinkplusGetUrlMock.getResponseError()
    );

    Exception error;
    Test.startTest();
    try {
      GmoLinkplusGetUrlSevice.Response response = GmoLinkplusGetUrlSevice.send(
        new GmoLinkplusGetUrlSevice.Parameter()
      );
    } catch (Exception e) {
      error = e;
    }
    Test.stopTest();
    System.assert(
      error instanceof GmoLinkplusGetUrlSevice.ApiException,
      'APIエラー発生確認'
    );
  }
}