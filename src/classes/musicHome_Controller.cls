public class musicHome_Controller {
    public String SearchText{get;set;} 
	public String option {get;set;}
    public List<Album__c> lstAlbums{get;set;}
    Public musicHome_Controller(Apexpages.StandardController controller){ 
    }
    //It is for Search Method
    public pageReference SearchAlbums(){        
    if(option == 'Name'){
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+SearchText+'&s_by='+option);
       pgRef.setRedirect(true);      
       return pgRef;
    }     
   if(option == 'Track__c.Name__C')
    {
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+searchText+'&s_by='+option);
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
      
       return pgRef;
    }    
    if(option == 'genre__r.Name__c'){
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+searchText+'&s_by='+option);
       pgRef.setRedirect(true);      
       return pgRef;
    }
    if(option == 'User__r.Name__c'){
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+SearchText+'&s_by='+option);
       pgRef.setRedirect(true);      
       return pgRef;
    }    
    if(option == 'Album_rating__C'){
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+SearchText+'&s_by='+option);
       pgRef.setRedirect(true);      
       return pgRef;
    }       
       else
       return null;       
    }
}