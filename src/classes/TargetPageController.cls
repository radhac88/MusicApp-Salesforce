public class TargetPageController 
{
    Public string accName {get;set;}
    Public string accIndustry {get;set;}

    Public TargetPageController()
    {
        accName = ApexPages.CurrentPage().GetParameters().get('accName');
        accIndustry = ApexPages.CurrentPage().getParameters().get('accInd');
    }

    Public pagereference RedirectToSourcePage()
    {
        Pagereference pgRef = new PageReference('/apex/SourcePage');
        
        return pgRef.SetRedirect(true);
    }
}