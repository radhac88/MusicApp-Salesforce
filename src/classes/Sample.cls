public class Sample 
{
    public String option {get;set;}
    
    public pageReference pass()
    {
        PageReference pg = new PageReference('/apex/radio2?val=' + option);
        pg.setRedirect(true);
        return pg;
    }
}