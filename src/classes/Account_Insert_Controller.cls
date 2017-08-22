public with sharing class Account_Insert_Controller {
   public Account acc{get;set;} 
   public Account_Insert_Controller(){
       acc = new Account();
   }
   public void Save(){
    
      insert acc;
   
   }
}