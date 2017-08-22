public class ListPageController {
  
public String SearchText{get;set;}
public string getCompany;
public string getCategory;
public String getValue;
public string query;
public String option {get;set;}

public List<Company__c> lstCompanies{get;set;}
public list<list<sObject>> soslResults {get;set;}
 public Integer rec { get; set; }
 public Integer tot { get; set; }

  // integer totalRecs = 0;
   integer count= 0;
   integer LimitSize= 10;
   
//Constructor
   public ListPageController(ApexPages.StandardController controller) {
    
        lstCompanies = new list<Company__c>();
        
        getcompany = ApexPages.CurrentPage().GetParameters().get('query');
        getCategory = ApexPages.CurrentPage().GetParameters().get('cat');
        getvalue = ApexPages.CurrentPage().GetParameters().get('s_by');
        system.debug(getValue);
        
            if(getCompany!='' || getCompany!=NULL && getValue == 'Company_Name__C')
            {
                
            query = 'SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Company_Name__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot = [select count() from Company__C WHERE Company_Name__C LIKE : getcompany+'%'];
            }
            
           /* if(getCompany!='' || getCompany!=NULL && getValue == 'Product__C')
            {
                
            query = 'SELECT id, Company_Name__c,Domain__C,Logo__c,Product__C,teeee__c from Company__c WHERE Product__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot=totalRecs = [select count() from Company__C WHERE Company_Name__C LIKE : getcompany+'%'];
            }*/
            if(getCompany!='' || getCompany!=NULL && getValue == 'Product__C')
            {
             String searchquery='FIND\'getCompany*\'IN ALL FIELDS RETURNING Company__C(Company_Name__C , Logo__C , Product__C)'; 
              soslResults = search.query(searchquery);
              system.debug(soslResults);
            }
          
            if((getCompany!='' || getCompany!=NULL) && getValue == 'Domain__C')
            {
                
            query = 'SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot = [select count() from Company__C WHERE Domain__C LIKE : getcompany+'%'];
            }
            
            if((getCompany!='' || getCompany!=NULL) && getValue == 'Sub_Domain__C')
            {
                
            query = 'SELECT id, Company_Name__c,Domain__C,Sub_Domain__C,Logo__c,teeee__c from Company__c WHERE Sub_Domain__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot = [select count() from Company__C WHERE Sub_Domain__C LIKE : getcompany+'%'];
            }
            
            if((getCompany!='' || getCompany!=NULL) && getValue == 'Locality__C')
            {
                
            query = 'SELECT id, Company_Name__c,Domain__C,Sub_Domain__C,Logo__c,Locality__C,teeee__c from Company__c WHERE Locality__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot = [select count() from Company__C WHERE Locality__C LIKE : getcompany+'%'];
            }
          
        if(getCategory =='ESDM')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
             system.debug('++++++'+lstCompanies);
             tot = [select count() from Company__C WHERE Domain__C LIKE : getcategory+'%'];
        }
        if(getCategory =='Plastic')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot = [select count() from Company__C WHERE Domain__C LIKE : getcategory+'%'];
        }
        if(getCategory =='Govt Bodies')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot = [select count() from Company__C WHERE Domain__C LIKE : getcategory+'%'];
        }
        if(getCategory =='VCs')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot = [select count() from Company__C WHERE Domain__C LIKE : getcategory+'%'];
        }
        if(getCategory =='IT Services')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \'' +getCategory + '%\'LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot = [select count() from Company__C WHERE Domain__C LIKE : getcategory+'%'];
        }
        if(getCategory =='')
        {
            query = 'SELECT id,Domain__C, Company_Name__c,teeee__c,Logo__c from Company__c LIMIT:limitsize OFFSET:count';
            lstCompanies= Database.query(query);
            tot = [select count() from Company__C WHERE Domain__C LIKE : getcategory+'%'];
             
        }
      
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
   
   public List<Company__C> CompaniesList = new List<Company__C>();
   
   public List<Company__C> getCompaniesList () {
      List<Company__C> comp = new List<Company__C>();
       
      if(getCompany!='' || getCompany!=NULL && getValue=='Company_Name__C')
      {
      
       query = 'SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Company_Name__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
       comp  = Database.query(query);
       
      }
      
     /*if(getCompany!='' || getCompany!=NULL && getValue=='Product__C')
      {
      
       query = 'SELECT id, Company_Name__c,Domain__C,Logo__c,Product__C,teeee__c from Company__c WHERE Product__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
       comp  = Database.query(query);
       
      }*/
    
      if((getCompany!='' || getCompany!=NULL) && getValue=='Domain__C')
      {
      
       query = 'SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
       comp  = Database.query(query);
       
      }
      
      if((getCompany!='' || getCompany!=NULL) && getValue=='Sub_Domain__C')
      {
      
       query = 'SELECT id, Company_Name__c,Domain__C,Sub_Domain__C,Logo__c,teeee__c from Company__c WHERE Sub_Domain__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
       comp  = Database.query(query);
       
      }
      
      if((getCompany!='' || getCompany!=NULL) && getValue=='Locality__C')
      {
      
       query = 'SELECT id, Company_Name__c,Domain__C,Sub_Domain__C,Logo__c,Locality__C,teeee__c from Company__c WHERE Locality__C LIKE \''+getcompany+'%\' LIMIT:limitsize OFFSET:count';
       comp  = Database.query(query);
       
      }
     
      if(getCategory =='ESDM')
      {
      comp = [SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE 'ESDM' LIMIT:limitsize OFFSET:count];
      }
      
      if(getCategory =='Plastic')
      {
      comp = [SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE 'Plastic' LIMIT:limitsize OFFSET:count];
      }
      
      if(getCategory =='Govt Bodies')
      {
      comp = [SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE 'Govt Bodies' LIMIT:limitsize OFFSET:count];
      }
      if(getCategory =='VCs')
      {
      comp = [SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE 'VCs' LIMIT:limitsize OFFSET:count];
      }
      
     if(getCategory =='IT Services')
      {
      comp = [SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c WHERE Domain__C LIKE 'IT Services' LIMIT:limitsize OFFSET:count];
      }
      
      if(getCategory =='')
      {
      comp = [SELECT id, Company_Name__c,Domain__C,Logo__c,teeee__c from Company__c LIMIT:limitsize OFFSET:count];
      }
     
     
        return comp;
    }
   
    //Pagination Methods
   
     public Void updatePage() {
   
      companiesList.clear();
      limitsize=rec;
     
      }
    
    public PageReference Firstbtn() {
     count=0;
        return null;
    }
      public PageReference prvbtn() {
      count=count-limitsize;
        return null;
    }
   
 public PageReference Nxtbtn() {
 count=count+limitsize;
        return null;
    }
 public PageReference lstbtn() {
 count= tot - math.mod(tot,LimitSize);
        return null;
    }


    public Boolean getNxt() {
        if((count+ LimitSize) > tot)
       return true;
     else
       return false;
        
    }
     public Boolean getPrv() {
      if(count== 0)
          return true;
        else
          return false;
     
        }
  }