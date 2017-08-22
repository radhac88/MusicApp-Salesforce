public class Home_Controller {

    public PageReference allAlbums() {
        return null;
    }


    public Home_Controller() {

    }

public String SearchText{get;set;}
public List<Company__c> lstCompanies{get;set;}
public String option {get;set;}
    public Home_Controller(ApexPages.StandardController controller) {

    }

    public pageReference searchCompanies()
    {
        
    if(option == 'Company_Name__C')
    {
       pageReference pgRef = new pageReference('/apex/ListPage?query='+SearchText+'&s_by='+option);
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
      
       return pgRef;
    }
     
    if(option == 'Product__C')
    {
       pageReference pgRef = new pageReference('/apex/ListPage?query='+searchText+'&s_by='+option);
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
      
       return pgRef;
    }
    
    if(option == 'Domain__C')
    {
       pageReference pgRef = new pageReference('/apex/ListPage?query='+searchText+'&s_by='+option);
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
      
       return pgRef;
    }
    
    if(option == 'Sub_Domain__C')
    {
       pageReference pgRef = new pageReference('/apex/ListPage?query='+SearchText+'&s_by='+option);
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
      
       return pgRef;
    }
    
    if(option == 'Locality__C')
    {
       pageReference pgRef = new pageReference('/apex/ListPage?query='+SearchText+'&s_by='+option);
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
      
       return pgRef;
    }
       
       else
       return null;
       
    }
   
    
}