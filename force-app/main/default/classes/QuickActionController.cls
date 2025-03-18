public class QuickActionController {

    @AuraEnabled
    public static String parseTransactions(String accountId) {
        try {
            ExternalService.TransactionParser parser = new ExternalService.TransactionParser();
        
            ExternalService.TransactionParser_ParseTransactions_IN_body body = new ExternalService.TransactionParser_ParseTransactions_IN_body();
            body.accountId = '001G100000QcZSPIA3';
            ExternalService.TransactionParser.ParseTransactions_Request request = new ExternalService.TransactionParser.ParseTransactions_Request();
            request.body = body;
        
            ExternalService.TransactionParser.ParseTransactions_Response response = parser.ParseTransactions(request);
            return response.Code200.message;
        } catch (ExternalService.TransactionParser.ParseTransactions_ResponseException ex) {
            return 'FAILED!: ' + ex.responseCode + ' ' + ex.defaultResponse;
        }
    }
        
}