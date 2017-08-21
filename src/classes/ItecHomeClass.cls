public class ItecHomeClass {
    public String SearchText {get;set;}
public List<Company__c> companieslist{get;set;}
    public ItecHomeClass(ApexPages.StandardController controller) {

    }
    
    public void SearchCompanies(){
        if(SearchText!='' && SearchText!=NULL){
        SearchText += '%';
        companieslist = [select id, Company_Name__c,Logo__c from Company__c where Company_Name__c LIKE : SearchText];
    }
    }
    public Pagereference ListPage(){
        PageReference pageRef = new PageReference('/apex/ITECListPage?='+SearchText);
        pageRef.setRedirect(true);
        return pageRef;
    }

}