public class WarrantyApiCallout {
    public class ParamsListInfo {
        @InvocableVariable(required=true label='プランコード') // サービスコード（卸元プランコード）
        public String plan_code;

        @InvocableVariable(required=true label='オプションID') // オプションID
        public String option_id;
        
        @InvocableVariable(required=true label='登録種別') // 登録or解約
        public String register_type;
    }
    
    public class Response {
        @InvocableVariable
        public Boolean success;
        
        @InvocableVariable
        public String message;
    }
    
    @InvocableMethod(Label='匠ワランティAPI')
    public static Response[] run(List<ParamsListInfo> info) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        
        Map<String,String> postBody = new Map<String,String>();
        postBody.put('plan_code', info[0].plan_code);
        postBody.put('option_id', info[0].option_id);
        postBody.put('register_type', info[0].register_type);
        String reqBody = JSON.serialize(postBody);
        
        // req.setEndpoint('https://k-seike.ecolog.bod-develop.com/api/warranty/call');
        req.setEndpoint('https://entry.eco-log.co.jp/api/warranty/call');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(reqBody);
        
        HttpResponse res = http.send(req);
        Integer statusCode = res.getStatusCode();
        System.debug(statusCode);
        
        if (statusCode != 200) {
            System.debug('失敗');
            
            Response[] results = new List<Response>();
            Response response = new Response();
            
            response.success = false;
            response.message = 'メッセージ：失敗';
            
            results.add(response);
            
            System.debug(results);
            
            return results;
        } else {
            System.debug('成功');
            
            Response[] results = new List<Response>();
            Response response = new Response();
            
            response.success = true;
            response.message = 'メッセージ：成功';
            
            results.add(response);
            
            System.debug(results);
            
            return results;
        }
    }
}