@isTest
global class WarrantyApiMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {        
        System.assertEquals('https://entry.eco-log.co.jp/api/warranty/call', req.getEndpoint());
        System.assertEquals('POST', req.getMethod());
        
        // Create a fake response
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('{"example":"test"}');
        res.setStatusCode(200);
        return res;
    }
}