public class Sample1 
{
    public String option {get;set;}
    
    public Sample1()
    {
        option = ApexPages.currentPage().getParameters().get('val');
    }
}