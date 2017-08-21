public class Sample1_Controller {

   public String SearchText{get;set;}
public List<Company__c> lstCompanies{get;set;}
    
    public Sample1_Controller (ApexPages.StandardController controller) {
       
    }
  
    public pageReference searchCompanies()
    {
   
       pageReference pgRef = new pageReference('/apex/ListPage?companyName='+SearchText);
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
       return pgRef;
    }
    
}