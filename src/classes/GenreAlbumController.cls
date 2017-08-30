public class GenreAlbumController {
public string getGenreId {get;set;}
    public List<Album__c> albums {get;set;}
    
public GenreAlbumController (ApexPages.StandardController controller) {
    getGenreId = ApexPages.CurrentPage().GetParameters().get('GenreId');    
       }
    public Void getAlbums(){        
          if(getGenreId!='' || getGenreId!=NULL)
        {
          albums = [select id,Name,User__c,Cover_Photo__c,genre__r.Name__c,Genre__c,User__r.Name__c from Album__C Where Genre__c =: getGenreId];
            
        }       
    }

}