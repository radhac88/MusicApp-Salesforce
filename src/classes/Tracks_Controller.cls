public class Tracks_Controller {    
public string albumName{get;set;}
public Album__C albm{get;set;}
public List<Album__c> albums {get;set;}
public List<Track__C> lstTracks{get;set;}

public Tracks_controller(){
    albumName = ApexPages.CurrentPage().GetParameters().get('album');
    albm = [select id,Cover_Photo__C,Name,User__r.Name__c,genre__r.Name__c from Album__C Where Name =:albumName];
}

public List<Track__C> getAllTracks(){
    lstTracks = [Select id,Name,Genre__c,Track_Id__c,User_Album__r.Name,Album__r.Name,Album__r.Cover_Photo__c From Track__c where Album__r.name =: albumName OR User_Album__r.Name =: albumName];
	return lstTracks;
}
public void Albums(){        
         if(albumName!='' || albumName!=NULL)
        {
          albums = [select id,Name,User__c,Cover_Photo__c,genre__r.Name__c,User__r.Name__C from Album__C Where User__r.Name__C Like : albm.User__r.Name__C];
        }      
    }
    public PageReference tracksSelected(){
        PageReference pgref = New PageReference('/apex/AddTracksToAlbumsPage?id='+albumName);
           pgref.setRedirect(true);
           return pgRef;
    }
}