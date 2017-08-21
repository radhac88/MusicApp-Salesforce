public with sharing class CustomPaginationDemo
{
Public Track__C track{get;set;}
   
public List<ContactWrapper> lstWrapper {get;set;}
public List<ContactWrapper> lstSetController{get;set;}

public List<Track__C> selectedTracks{get;set;}
public List<Track__C> tracksToUpdate{get;set;}

CustomIterable obj;

    public CustomPaginationDemo() 
    {
        track = new Track__C();
        lstWrapper =  new List<ContactWrapper>();
        lstSetController = new List<ContactWrapper>();

        List<Track__C> lstTrack = [Select id,Name,Album__c,Genre__C,Track_Id__c From Track__C];
        
        for(Track__C cont : lstTrack )
        {
            lstWrapper.add(new ContactWrapper(cont ,false));
        }

        obj = new CustomIterable (lstWrapper); 
        obj.setPageSize = 5;
        next();         
    }
    
    public pageReference Add(){
        selectedTracks = new List<Track__C>();
        tracksToUpdate = new List<Track__C>();
       for(ContactWrapper wrapTrackObj : lstSetController) {
        
        if(wrapTrackObj.isSelected == true) {
            selectedTracks.add(wrapTrackObj.cont);
          }
          system.debug('Selected Tarcks:::'+selectedTracks);
          
        } 
        
        for(Track__c cc: [Select id,Name,Album__c,Genre__C,Track_Id__c From Track__C where id IN: selectedTracks] ){            
        
            cc.Album__c = track.album__C;
            tracksToUpdate.add(cc);
        }
      
        upsert tracksToUpdate;
        
        pageReference pgref = New pageReference('/apex/musicHome');
        pgref.setRedirect(false);
        return pgRef;
        
    }
    
        public Boolean hasNext {
            get 
            {
                return obj.hasNext();
            }
            set;
        }
        
        public Boolean hasPrevious {
            get 
            {
                return obj.hasPrevious();
            }
            set;
        }
        
        public void next() 
        {
            lstSetController = obj.next();
        }
        
        public void previous() 
        {
            lstSetController = obj.previous();
        }
    
}