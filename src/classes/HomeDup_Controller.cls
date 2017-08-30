Public class HomeDup_Controller{

public string searchText{get;set;}
public string option{get;set;}
public string getSelected;
public string getValue;
public Integer trackCount{get;set;}

Public HomeDup_Controller(){
    
    getSelected = ApexPages.CurrentPage().GetParameters().get('query');
    getValue = ApexPages.CurrentPage().GetParameters().get('s_by');      

}


     //Search Album Method
    public pageReference Search(){
        if(option == 'Name')
        {
           pageReference pgRef = new pageReference('/apex/HomeDupl?query='+SearchText+'&s_by='+option);
           system.debug('======='+SearchText);
           pgRef.setRedirect(true);
          
           return pgRef;
        }
        
        if(option == 'Track__c.Name__C')
        {
           pageReference pgRef = new pageReference('/apex/HomeDupl?query='+SearchText+'&s_by='+option);
           system.debug('======='+SearchText);
           pgRef.setRedirect(true);
          
           return pgRef;
        }
        
        if(option == 'genre__r.Name__c')
        {
           pageReference pgRef = new pageReference('/apex/HomeDupl?query='+SearchText+'&s_by='+option);
           system.debug('======='+SearchText);
           pgRef.setRedirect(true);
          
           return pgRef;
        }
        
        if(option == 'User__r.Name__c')
        {
           pageReference pgRef = new pageReference('/apex/HomeDupl?query='+SearchText+'&s_by='+option);
           system.debug('======='+SearchText);
           pgRef.setRedirect(true);
          
           return pgRef;
        }
        
        if(option == 'Album_rating__C')
        {
           pageReference pgRef = new pageReference('/apex/HomeDupl?query='+SearchText+'&s_by='+option);
           system.debug('======='+SearchText);
           pgRef.setRedirect(true);
          
           return pgRef;
        }
        
        
    else {
        return NULL;
    }
    }
    
    public ApexPages.StandardSetController setCon {
        get {
         if(SetCon == NULL){
           
            if(getSelected!='' || getSelected!=NULL && getValue == 'Name')
            {
                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Name,Cover_Photo__c,Album_Rating__c,Rating__c,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE Name LIKE : getSelected+'%']));
            }
           
           /* if(getSelected!='' || getSelected!=NULL && getValue == 'Track__c.Name__C"')
            {
                
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,name,Rating__c,(Select id,Album__C,User_Album__c From Tracks__r) from Album__C where id in (select Album__c From Track__C where Track_Name__C LIKE :getSelected+'%']));
            }*/
            
           if(getSelected!='' || getSelected!=NULL && getValue == 'genre__r.Name__c')
            {
                  setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Name,Cover_Photo__c,Rating__c,Album_Rating__c,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE genre__r.Name__c LIKE : getSelected+'%']));
            
            }    
            
           if(getSelected!='' || getSelected!=NULL && getValue == 'User__r.Name__c')
            {
                  setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Name,Cover_Photo__c,Rating__c,Album_Rating__C,genre__r.Name__c,User__r.Name__c from Album__C WHERE User__r.Name__c LIKE : getSelected+'%']));
             
            } 
            
           if(getSelected!='' || getSelected!=NULL && getValue == 'Album_Rating__C')
            {
                  setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Name,Cover_Photo__c,Rating__c,Album_Rating__C,genre__r.Name__c,User__r.Name__c from Album__C WHERE Album_Rating__C LIKE : getSelected+'%']));
             
            } 
           }
           return setCon; 
        }
        set;
    }

public List<Album__C> getAlbums() {
         setCon.setpagesize(2);
         return (List<Album__C>) setCon.getRecords();
    }
    
    
}