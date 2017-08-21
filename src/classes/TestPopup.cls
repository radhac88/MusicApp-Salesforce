public with sharing class TestPopup {
    public Boolean displayPopup {get;set;}
    public boolean display{get;set;}
    public TestPopup(ApexPages.StandardController controller) {

    }    
    public void showPopup()
    {        
    displayPopup = true; 
    display = false; 
      
    }    
    public void closePopup() {
        displayPopup = false;
        display = true;
      }
    public void showContact(){
    displayPopup = false;
    display = true;
    }
    public PageReference redirectPopup()
    {
    displayPopup = false;
    
        //Please uncomment below 3 statements and replace YourObjectId
        PageReference p=new Pagereference('/'+003);
        p.setRedirect(true);
       return p;
        
    }
 
}