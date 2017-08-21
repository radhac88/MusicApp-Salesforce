public class SourcePageController 
{
    Public string accountName {get;set;}
    Public string accountIndustry {get;set;}

    Public PageReference RedirectToTargetPage()
    {
        Pagereference pgRef = new PageReference('/apex/TargetPage?accName='+accountName+'&accInd='+accountIndustry);
        //PageReference pgRef = Page.TargetPage;
               
        return pgRef.SetRedirect(true);
    }
}