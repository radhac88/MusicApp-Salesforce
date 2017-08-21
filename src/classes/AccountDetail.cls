public with sharing class AccountDetail {  
    public ListCollection Paging {get;set;}

    //Construtors
    public AccountDetail() {
        try {
            Paging = new ListCollection();
            Paging.PageSize = 10;
            Paging.Accounts = queryAccounts();
        }
        catch (Exception unexpectedException) {
            ApexPages.addMessages(unexpectedException);
        }   
    }

    //Query Methods
    private List<Company__c> queryAccounts() {
        return [SELECT Id, Company_Name__c FROM Company__c];
    }

    //Internal Classes
    public class ListCollection extends Pageable {
      public List<Company__c> Accounts {get;set;}

      public override integer getRecordCount() {
            return (Accounts == null? 0 : Accounts.size());
      }
    }
}