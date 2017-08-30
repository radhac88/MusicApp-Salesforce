public class NewTracks_Controller {
    public id id2{get;set;}
    public Track__c track{get;set;}
    public Album__c albm{get;set;}
    public List<Track__C> lstTracks{get;set;}
	public Integer rowNum{get;set;}
    public NewTracks_Controller (){
        id2=Apexpages.currentpage().getparameters().get('id');
        if (id2!=null){
            albm=[select id, Name from Album__c where id=:id2];
        }
         track = new Track__C();
        track.Album__c=id2;
    	lstTracks = new List<Track__C>();
    	lstTracks.Add(track);
    }
    public void addTrack(){
    Track__C track = new Track__C();
        track.Album__c=id2;
    lstTracks.add(track);
}

 	public void delRow()
    {
        rowNum = Integer.valueOf(apexpages.currentpage().getparameters().get('index'));
        lstTracks.remove(rowNum);  
    } 

	public pageReference Save(){        
    upsert lstTracks;
    pageReference pgRef = new pageReference ('/apex/musicHome');
    pgRef.setRedirect(true);
    return pgRef;
}
}