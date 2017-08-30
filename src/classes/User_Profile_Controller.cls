public class User_Profile_Controller {

public string getUserId {get;set;}
    public User_Profile__c comp{get;set;}
    public List<Album__c> albums {get;set;}
    
public User_Profile_Controller (ApexPages.StandardController controller) {
    getUserId = ApexPages.CurrentPage().GetParameters().get('UserId');
     if(getUserId!='' || getUserId!=NULL)
        {
    
            String query = 'Select id, Name,User__c,Date_of_Birth__c,Gender__c,Picture__c, Address__c,User__r.Name__c from User_Profile__c Where User__c =: getUserId';
            comp= Database.query(query);
            system.debug('Company is::::: ' + comp.Name);            
        }
       }
    public Void getAlbums(){        
          if(getUserId!='' || getUserId!=NULL)
        {
          albums = [select id,Name,User__c,Cover_Photo__c,Rating__c,genre__r.Name__c,User__r.Name__c from Album__C Where User__c =: getUserId];
            
        }       
    }
}