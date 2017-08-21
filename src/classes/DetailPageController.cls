public class DetailPageController {

public string SearchText{get;set;}
public string getCompanyName{get;set;}
public Company__C comp{get;set;}
  
    public DetailPageController(ApexPages.StandardController controller) {
        getCompanyName = ApexPages.CurrentPage().GetParameters().get('Comapany');
            
            
        if(getCompanyName!='' || getCompanyName!=NULL)
        {
    
            String query = 'SELECT id, Company_Name__c,Logo__c,City__c,Contact__c,Domain__c,Sub_Domain__c,Email__c,Employees__c,Product__c,Position__c,Head__c,Street__c,Locality__c,Revenue__c,Web_Site__c from Company__c Where Company_Name__C =: getcompanyName';
            comp= Database.query(query);
            system.debug('Company is::::: ' + comp.Company_Name__C);
           
        }
        }
        
        public pageReference searchCompanies(){
       
           pageReference pgRef = new pageReference('/apex/ListPage?companyName='+SearchText);
           system.debug('======='+SearchText);
           pgRef.setRedirect(true);
           return pgRef;
           
    }
    
}