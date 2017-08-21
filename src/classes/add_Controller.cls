public class add_Controller {

    public Integer rec { get; set; }
    public Integer tot { get; set; }
    public Integer totalRecs = 0;
    public Integer count= 0;
    public Integer LimitSize= 5;

//Wrapper Class
public class wrapTrack1 {
    
    public Track__C acc {get; set;}
    public Boolean selected {get; set;} 
        
        public wrapTrack1(Track__C a) {
            acc = a;
            selected = false;
        }
    }

public Track__C track {set;get;}
    //Our collection of the class/wrapper objects wrapAccount
public List<wrapTrack1> wrapTrackList {get; set;}
public List<Track__C> selectedTracks{get;set;}
public List<Track__C> updatedTracks{get;set;}
    
    public add_Controller(){        
        
        tot=totalRecs = [select count() from Track__C];
        updatedTracks = new list<Track__C>();
    system.debug('Limit Size:' +Limitsize);
    system.debug('Count:' +count);    
        if(wrapTrackList == null) {
            wrapTrackList = new List<wrapTrack1>();
            for(Track__C t: [Select id,Name,Album__c,Genre__C,Track_Id__c From Track__C LIMIT:limitsize OFFSET:count]) {
                // As each Account is processed we create a new wrapAccount object and add it to the wrapAccountList
                wrapTrackList.add(new wrapTrack1(t));
            }
            System.debug('Wrap TrackList:' +wrapTrackList);
        }
         track = new Track__c();
        
    }
    
    
     
    public pageReference processSelected() {    
       
        updatedTracks = new list<Track__C>();
        selectedTracks = new List<Track__C>(); 
        
        for(wrapTrack1 wrapTrackObj : wrapTrackList) {
            if(wrapTrackObj.selected == true) {
                selectedTracks.add(wrapTrackObj.acc);
            }
        } 
      
        for(Track__c cc: [Select id,Name,Album__c,Genre__C,Track_Id__c From Track__C where id IN: selectedTracks] ){            
            system.debug('Selected Tracks:::'+cc);
            cc.Album__c = track.album__C;
            updatedTracks.add(cc);
        }
      
        upsert updatedTracks;
        
         pageReference pgref = New pageReference('/apex/musicHome');
        pgref.setRedirect(true);
        return pgRef;
    }
    
    //Pagination methods
       public void updatePage() {
       selectedTracks.clear();
          limitsize=rec;
      selectedTracks=[Select id,Name,Album__c,Genre__C,Track_Id__c From Track__C LIMIT:rec OFFSET:count];
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
 count= totalrecs - math.mod(totalRecs,LimitSize);
        return null;
    }


    public Boolean getNxt() {
        if((count+ LimitSize) > totalRecs)
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