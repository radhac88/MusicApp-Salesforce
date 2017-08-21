public class ListPage1 {

public String SearchText{get;set;}
public string getCompany;
public string getCategory;
public string query;

public List<Company__c> lstCompanies{get;set;}
   
//Constructor
   public ListPage1() {
        
      
        lstCompanies = new list<Company__c>();
        
        getcompany = ApexPages.CurrentPage().GetParameters().get('CompanyName');
        getCategory = ApexPages.CurrentPage().GetParameters().get('cat');
         
        
        if(getCompany!='' || getCompany!=NULL)
            {
    
            query = 'SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Company_Name__c LIKE \''+getcompany+'%\'';
            lstCompanies= Database.query(query);
           }
           
        
        
        if(getCategory =='ESDM')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'';
            lstCompanies= Database.query(query);
             system.debug('++++++'+lstCompanies);
        }
        if(getCategory =='Plastic')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'';
            lstCompanies= Database.query(query);
            
        }
        if(getCategory =='Govt Bodies')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'';
            lstCompanies= Database.query(query);
            
        }
        if(getCategory =='VCs')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'';
            lstCompanies= Database.query(query);
            
        }
        if(getCategory =='IT Services')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'';
            lstCompanies= Database.query(query);
            
        }
        if(getCategory =='')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,teeee__c,Logo__c from Company__c';
            lstCompanies= Database.query(query);
              
        }
       
    }
                          
    public pageReference SearchCompanies()
    {
      
        pageReference pgRef = new pageReference('/apex/ListPage?companyName='+SearchText);
        pgRef.setRedirect(true);
        return pgRef;
    
    }
    
  
}