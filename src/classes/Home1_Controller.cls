public class Home1_Controller {
public String SearchText{get;set;}
public List<Company__c> lstCompanies{get;set;}
    
    public pageReference searchCompanies()
    {
   
       pageReference pgRef = new pageReference('/apex/ListPage?companyName='+SearchText);
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
       return pgRef;
    }
    
    public pageReference SearchESDM(){
        lstCompanies = [select Company_Name__C,Logo__C,Domain__C from Company__C Where Domain__C LIKE 'ESDM'];
        pageReference pgRef = new pageReference('/apex/ListPage?Category='+'ESDM');
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
       return pgRef;
    }
}