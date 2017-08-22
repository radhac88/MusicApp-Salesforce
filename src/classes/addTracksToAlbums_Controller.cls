public class addTracksToAlbums_Controller{
    public Integer totalRecs = 0;
    public Integer count= 0;
    public Integer LimitSize= 5;
    public Track__C track {set;get;}
    public List<wrapTrack> wrapTrackList {get;set;}
    public List<wrapTrack> wrapSetController{get;set;}
    public List<Track__C> selectedTracks{get;set;}
    public List<Track__C> updatedTracks{get;set;}
        public Void updatePage(){
           wrapTrackList.clear();
           for(Track__C a: [Select id,Name,Album__c,Genre__C,Genre__r.Name__C,Track_Id__c From Track__C LIMIT:limitsize OFFSET:count]){
               wrapTrackList.add(new wrapTrack(a));
           }
        }
    public addTracksToAlbums_Controller(){
           totalRecs = [select count() from Track__C];
           track = new Track__c();
           updatedTracks = new list<Track__C>();
        	wrapSetController = new List<wrapTrack>();
           if(wrapTrackList == null) {
              wrapTrackList = new List<wrapTrack>();
              updatePage();            
           }          
        }
        public pageReference processSelected(){    
           updatedTracks = new list<Track__C>();
                   selectedTracks = new List<Track__C>(); 
           for(wrapTrack wrapTrackObj : wrapTrackList) {
               if(wrapTrackObj.selected == true) {
                  selectedTracks.add(wrapTrackObj.acc);
               }
           } 
           for(Track__c cc: [Select id,Name,Album__c,User_Album__c,Genre__C,Track_Id__c From Track__C where id IN: selectedTracks]){            
               if(cc.Album__c != null){          
               		cc.User_Album__c = track.album__C;
               }
               else{
                   cc.Album__c = track.album__C;
               }
              updatedTracks.add(cc); 
           }
           upsert updatedTracks;        
           pageReference pgref = New pageReference('/apex/musicHome');
           pgref.setRedirect(true);
           return pgRef;
        }    
        public PageReference Firstbtn(){
           count=0;
           updatePage();
           return null;
        }
        public PageReference prvbtn(){          
           count=count-limitsize;
           updatePage();
           return null;
        }
        public PageReference Nxtbtn(){    
           count=count+limitsize;
           updatePage();
           return null;
        }
        public PageReference lstbtn(){
           count= totalrecs - math.mod(totalRecs,LimitSize);
           updatePage();
           return null;
        }
        public Boolean getNxt(){
           if((count+ LimitSize) > totalRecs)
               return true;
                else
               return false;        
        }
        public Boolean getPrv(){
           if(count== 0)
                return true;
                 else
                return false;     
        }
}