public class NewTracks_Controller {
    public Track__C track {get;set;}
	public List<Track__C> lstTracks{get;set;}
	public Integer rowNum{get;set;}

public NewTracks_controller(){
    track = new Track__C();
    lstTracks = new List<Track__C>();
    lstTracks.Add(track);
}

public void addTrack(){
    Track__C track = new Track__C();
    lstTracks.add(track);
}

 public void delRow()
    {
        rowNum = Integer.valueOf(apexpages.currentpage().getparameters().get('index'));
        lstTracks.remove(rowNum);  
    } 

public pageReference Save(){
    upsert lstTracks;
    pageReference pgRef = new pageReference ('/apex/Thankyou');
    pgRef.setRedirect(true);
    return pgRef;

}
}