public class albums_controller {

public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Name,Cover_Photo__c,Rating__C,Album_Rating__c,genre__r.Name__c,User__r.Name__c,(SELECT id FROM tracks__r) from Album__C]));
            }
            return setCon;
           
        }
        set;
       
    }
 
public List<Album__C> getAlbums() {
         setCon.setpagesize(6);
         
         return (List<Album__C>) setCon.getRecords();
       }
}