public class users_Controller {

public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [Select id,Name__c,Name,AlbumsCount__c,(select id,Picture__c from User_Profiles__r) From Users__C ]));
            }
            return setCon;
        }
        set;
    }

public List<Users__C> getUsers() {
         setCon.setpagesize(3);
         return (List<Users__C>) setCon.getRecords();
    }

}