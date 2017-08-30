public class Tracks_Controller {   
public string albumName{get;set;}
public Album__C albm{get;set;}
public List<Album__c> albums {get;set;}
public List<Track__C> lstTracks{get;set;}
public Integer rating {get; set;}

public Tracks_controller(){
    albumName = ApexPages.CurrentPage().GetParameters().get('album');
    albm = [select id,Cover_Photo__C,Name,User__r.Name__c,genre__r.Name__c from Album__C Where Name =:albumName];
    
}

public List<Track__C> getAllTracks(){
    lstTracks = [Select id,Name,Track_Name__C,Genre__c,Track_Id__c,User_Album__r.Name,Album__r.Name,Album__r.Cover_Photo__c From Track__c where Album__r.name =: albumName OR User_Album__r.Name =: albumName];
    return lstTracks;
}
public void Albums(){        
         if(albumName!='' || albumName!=NULL)
        {
          albums = [select id,Name,User__c,Rating__c,Cover_Photo__c,genre__r.Name__c,User__r.Name__C from Album__C Where User__r.Name__C Like : albm.User__r.Name__C];
        }      
    }
    public PageReference tracksSelected(){
        PageReference pgref = New PageReference('/apex/AddTracksToAlbumsPage?id='+albm.ID);
           pgref.setRedirect(true);
           return pgRef;
    }
    
    public  void UpdateAlbum(){        
       albm.Album_Rating__c = String.valueof(rating);
       update albm;
    /*   PageReference pgref = New PageReference('apex/TracksPage?album={!albm.name}');
           pgref.setRedirect(true);
           return pgRef;*/
        }
}