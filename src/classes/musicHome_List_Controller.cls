public class musicHome_List_Controller {
    
    public String SearchText{get;set;} 
    public String option {get;set;}
    public string getAlbum;
    public String getValue;
    public string query;
    public List<Album__c> lstAlbums{get;set;}
    public Integer rec {get;set;}
    public Integer tot {get;set;}
    Public Integer count= 0;
    Public Integer LimitSize= 3;
    
    Public musicHome_List_Controller(Apexpages.StandardController controller){ 
    
        lstAlbums=new list<Album__c>();
    
        getAlbum = ApexPages.CurrentPage().GetParameters().get('query');
        getvalue = ApexPages.CurrentPage().GetParameters().get('s_by');
        
        if(SearchText=='' || SearchText == NULL){
            SearchText=getAlbum;
        }
        if(option=='' || option == NULL){
            option=getvalue;
        }
       
        //getting output by album name
        if((getAlbum!='' || getAlbum!=NULL) && getValue == 'Name'){
            query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE Name LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
            lstAlbums = Database.query(query);
            tot = [select count() from Album__C WHERE Name LIKE : getAlbum+'%'];
            }
       
        //getting output by track name
        if((getAlbum!='' || getAlbum!=NULL) && getValue == 'Track__c.Name__C'){
            query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE Name LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
            lstAlbums = Database.query(query);
            tot = [select count() from Album__C WHERE Name LIKE : getAlbum+'%'];
            }
       
        //getting output by Genre
        if((getAlbum!='' || getAlbum!=NULL) && getValue == 'genre__r.Name__c'){              
            query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE genre__r.Name__c LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
            lstAlbums = Database.query(query);
            tot = [select count() from Album__C WHERE genre__r.Name__c LIKE : getAlbum+'%'];
            }
       
        //getting output by User
        if((getAlbum!='' || getAlbum!=NULL) && getValue == 'User__r.Name__c'){                
            query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE User__r.Name__c LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
            lstAlbums = Database.query(query);
            tot = [select count() from Album__C WHERE User__r.Name__c LIKE : getAlbum+'%'];
            }
       
        //getting output by Rating
        if((getAlbum!='' || getAlbum!=NULL) && getValue == 'Album_Rating__C'){                
           query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C Where Album_Rating__c  LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
           lstAlbums = Database.query(query);
           tot = [select count() from Album__C WHERE Album_Rating__C LIKE : getAlbum+'%'];
           }
    }
   
    //It is for Search Method
    public pageReference SearchAlbums(){        
   
    if(option == 'Name'){
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+SearchText+'&s_by='+option);
       pgRef.setRedirect(true);      
       return pgRef;
    }     
   
    if(option == 'Track__c.Name__C')
    {
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+searchText+'&s_by='+option);
       system.debug('======='+SearchText);
       pgRef.setRedirect(true);
      
       return pgRef;
    }    
   
    if(option == 'genre__r.Name__c'){
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+searchText+'&s_by='+option);
       pgRef.setRedirect(true);      
       return pgRef;
    }
   
    if(option == 'User__r.Name__c'){
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+SearchText+'&s_by='+option);
       pgRef.setRedirect(true);      
       return pgRef;
    }    
   
    if(option == 'Album_rating__C'){
       pageReference pgRef = new pageReference('/apex/musicHome_List?query='+SearchText+'&s_by='+option);
       pgRef.setRedirect(true);      
       return pgRef;
    }       
   
       else
       return null;       
    }    
    
    public List<Album__c> getAlbumsList(){
    
      List<Album__c> album = new List<Album__c>();
    
      if((getAlbum!='' || getAlbum!=NULL) && getValue == 'Name')
      {
            query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE Name LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
            album = Database.query(query);
     }
    
     //getting output by Track
        if((getAlbum!='' || getAlbum!=NULL) && getValue == 'Track_Name__C')
        {              
            query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE genre__r.Name__c LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
            album = Database.query(query);
         }
   
    //getting output by Genre
        if((getAlbum!='' || getAlbum!=NULL) && getValue == 'genre__r.Name__c')
        {              
            query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE genre__r.Name__c LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
            album = Database.query(query);
         }
   
    //getting output by User
        if((getAlbum!='' || getAlbum!=NULL) && getValue == 'User__r.Name__c')
        {                
            query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C WHERE User__r.Name__c LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
            album = Database.query(query);
        }
   
    //getting output by Rating
        if((getAlbum!='' || getAlbum!=NULL) && getValue == 'Album_Rating__C')
        {                
           query = 'select id,Name,Cover_Photo__c,Album_Rating__c,Rating__C,genre__r.Name__c,User__r.Name__c,(SELECT id,Name,Track_Name__C FROM tracks__r) from Album__C Where Album_Rating__c  LIKE \''+getAlbum+'%\' LIMIT:limitsize OFFSET:count';
           album = Database.query(query);
         }    
        return album;
   
    }   
   
   //Pagination Methods   
   
     public Void updatePage() {
          limitsize=rec;
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
         count= tot - math.mod(tot,LimitSize);
         return null;
        }

        public Boolean getNxt() {
        if((count+ LimitSize) > tot)
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