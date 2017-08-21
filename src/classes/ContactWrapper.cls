global class ContactWrapper
{
public Boolean isSelected {get;set;}
public Track__C cont{get;set;}        
    public ContactWrapper(Track__C cont,Boolean isSelected)
    {
        this.cont= cont;
        this.isSelected= isSelected;
    }
    
}