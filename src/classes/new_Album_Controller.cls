public class new_Album_Controller {
public Album__C album{get;set;}
    public Track__c track {get;set;}
public new_Album_Controller(){
    album = new Album__C();
    track= new Track__c();
}
public pageReference OldSave(){
    insert album;
        PageReference pgref = New PageReference('/apex/AddTracksToAlbumsPage?id='+album.ID);
           pgref.setRedirect(true);
           return pgRef;
    }
public pageReference NewSave(){
    insert album;
        PageReference pgref = New PageReference('/apex/NewTracksPage?id='+album.ID);
           pgref.setRedirect(true);
           return pgRef;
    }
    public pageReference Save(){
    insert album;
        PageReference pgref = New PageReference('/apex/musicHome');
           pgref.setRedirect(true);
           return pgRef;
    }
}