@isTest
public class WarrantyApiCalloutTest {
    public class TestParamsListInfo {
        public String plan_code = 'T1A5CA0082060WYD';
        public String option_id = 'TOC0000510';
        public String register_type = '登録';
    }
    
    public class Response {
        public Boolean success;        
        public String message;
    }
    
    @isTest static void testCallout() {
        Test.setMock(HttpCalloutMock.class, new WarrantyApiMock());
        
        WarrantyApiCallout.ParamsListInfo info = new WarrantyApiCallout.ParamsListInfo();
        
        info.plan_code= 'T1A5CA0082060WYD';
        info.option_id = 'TOC0000510';
        info.register_type = '登録';
        
        WarrantyApiCallout.run(new List<WarrantyApiCallout.ParamsListInfo>{info});
    }
}